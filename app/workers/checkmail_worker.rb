class CheckmailWorker
  include Sidekiq::Worker

  def perform(id)
    authorize
    messageByHistoryId(id)
  end

  def authorize
    @service = Api::Google::AuthenticationService.run
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

  def gerarProtocolo(tipo)
    case tipo
      when "reclamacao"
        #Pesquisar quantidade de reclamacoes
        num = Reclamacao.where("position = 0 && tipo = 'reclamacao'").size
        "RC" + (sprintf '%05d', num+1)
      when "cancelamento"
        num = Reclamacao.where("position = 0 && tipo = 'cancelamento'").size
        "CL" + (sprintf '%05d', num+1)
    end
  end

  def putsemail(id, historyid)
    if Reclamacao.where(message_id: id).size <= 0
      tipo = nil
      begin
        mail = @service.get_user_message "me", id
        mail = nil if !"Label_8044593807677884376".in?(mail.label_ids) && !"Label_8044593807677884376".in?(mail.label_ids)
      rescue => each
        mail = nil
      end

      if mail != nil && mail.payload.parts.first.body.data != nil
        message = mail.payload.parts.first.body.data.force_encoding("UTF-8")
        message = messageModificate(message)

        tipo = "reclamacao" if "Label_8044593807677884376".in?(mail.label_ids)
        position = Reclamacao.where(reclamacao_owner_id: mail.thread_id).size

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

        num_protocolo = gerarProtocolo(tipo)

        reclamacao = Reclamacao.create(texto: message, history_id: historyid, position: position, reclamacao_owner_id: mail.thread_id, message_id: id, tipo: tipo, subject: subject.last, email_sender: sender, status: status, num_protocolo: num_protocolo)
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
      end
    end
  end
end
