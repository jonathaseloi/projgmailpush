class MailCheckJob < ApplicationJob
  queue_as :default

  def perform(id)
    authorize
    messageByHistoryId(id)
  end

  def authorize
    @service = Api::Google::AuthenticationService.run
  end

  def criarTicket(reclamacao)
    @ticket = Ticket.create(ticket_params)

    reclamacao.ticket_id = ticket.id
  end

  def criarHistTicket(reclamacao, reclamacao_owner)
    @histticket = Histticket.new(histticket_params)
    @ticket = reclamacao_owner.ticket
    @histticket.ticket = @ticket
    @histticket.save

    reclamacao.ticket_id = ticket.id
  end

  def ticket_params
    params.require(:ticket)
          .permit(:solicitante, :departamento, :prioridade, :data_abertura,
                  :assunto, :descricao, :atendente, :data_fechamento,
                  :dificuldade, :observacao, :status, :tipo, :data_prevista,
                  :tempo_estimado, :ticket_attachment, :usuario, :cliente_id,
                  :cliente_nome, :avisar, :user_id, :aluno_id,
                  :servico_ticket_id, :responsavel_ids,
                  :departamento_id, :equipe_id, interessado_ids: [])
  end

  def histticket_params
    params.require(:histticket)
          .permit(:data_prevista, :tempo_estimado, :data_fechamento,
                  :dificuldade, :observacao, :status, :user_id,
                  :ticket_attachment)
  end

  def messageModificate(message)
    index_cut = message.index("> ")

    # Remove all conversation in responses
    if index_cut.present? && index_cut > 0
      message = message[0..index_cut]
    end

    # pegar posição da data para remover
    positions = message.enum_for(:scan, /Em .{3}\.,/).map{Regexp.last_match.begin(0)}
    if positions.present?
      message = message[0..positions.first-1]
    end

    message = message.squish

    message
  end

  def putsemail(id, historyid)
    if Reclamacao.where(message_id: id).size <= 0
      type = nil
      begin
        mail = @service.get_user_message "me", id
        mail = nil if !"Label_8044593807677884376".in?(mail.label_ids) && !"Label_8044593807677884376".in?(mail.label_ids)
      rescue => each
        mail = nil
      end

      if mail != nil && mail.payload.parts.first.body.data != nil
        message = mail.payload.parts.first.body.data.force_encoding("UTF-8")
        message = messageModificate(message)

        type = "Reclamacao" if "Label_8044593807677884376".in?(mail.label_ids)
        position = Reclamacao.where(reclamacao_owner_id: mail.thread_id).size
        snippet = mail.snippet

        #INIT Get Sender
        email = nil
        subject = nil
        mail.payload.headers.map{|h| {h.name=> h.value}}.each { |h| email = h.values() if h.key?("From")
          subject = h.values() if h.key?("Subject")} # Pegar o q estiver entre <>
        email = email.last
        index_cut = email.index("<")

        if index_cut.present? && index_cut > 0
          email = email[index_cut+1..email.size-2]
        end
        sender = email
        #END Get Sender

        status = :nao_iniciado
        reclamacao = Reclamacao.create(texto: message, history_id: historyid, position: position, reclamacao_owner_id: mail.thread_id, message_id: id, type: type, subject: subject.last, email_sender: sender, status: status)

        # Criar ticket em posição 0 ("zero")
        if (position == 0)
          # criarTicket(reclamacao)
        else
          reclamacao_owner = Reclamacao.where(reclamacao_owner_id: mail.thread_id, position: 0).last
          # criarHistTicket(reclamacao, reclamacao_owner)
        end
      end
    end
  end

  def messageByLabel
    result = service.list_user_messages @user_id, label_ids: ["Label_6032676558846782679"]

    result.messages.each { |label| 
      putsemail(label.id) # Old
    }
  end

  def messageByHistoryId(historyid)
    sleep 60
    response = @service.list_user_histories(@user_id, start_history_id: historyid)
    if response.history != nil
      response.history.each do |history_item|
        
        # mensagens adicionadas
        if history_item.messages_added != nil
          history_item.messages_added.each do |new_message|
            putsemail(new_message.message.id, historyid)
          end
        end

        # mensagens modificadas
        if history_item.messages != nil
          history_item.messages.each do |message|
            putsemail(message.id, historyid)
          end
        end

        # mensagens deletadas
        # if history_item.messages_deleted != nil
        #   puts "+-+-+ Deleted Message +-+-+"
        #   history_item.messages.each do |message|
        #     putsemail(message.id, historyid)
        #   end
        # end
      end
    end
  end

  def teste()
    request = {
      'labelIds': ['Label_8044593807677884376'],
      'topicName': 'projects/proj-gmail-push/topics/reclamacao-sub'
    }
    watch_request = Google::Apis::GmailV1::WatchRequest.new
    watch_request.topic_name= 'projects/proj-gmail-push/topics/reclamacao'
    response = @service.watch_user(userId='me', body=watch_request) do |request|
      puts request.history_id
      puts request.expiration
    end
  end
end
