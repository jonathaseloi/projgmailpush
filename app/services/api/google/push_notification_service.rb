module Api::Google
  class PushNotificationService
    attr_reader :id

    def initialize(id)
      @id = id
    end

    def process
      authorize
      messageByHistoryId(id)
    end

    private

    def authorize
      @service = Api::Google::AuthenticationService.run
    end

    def crarTicket(reclamacao)
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

      # message = message.delete("\r\n")
      # message.strip
      message = message.squish

      message
    end

    def putsemail(id, historyid)
      # sleep 70
      if Reclamacao.where(message_id: id).size <= 0
        begin
          email = @service.get_user_message "me", id
          email = nil if "Label_8466863835626248659".in?(email.label_ids)
        rescue => each
          email = nil
        end

        if email != nil && email.payload.parts.first.body.data != nil
          puts "-----MESSAGE BEGIN--------"
          message = email.payload.parts.first.body.data.force_encoding("UTF-8")
          message = messageModificate(message)

          puts message
          position = Reclamacao.where(reclamacao_owner_id: email.thread_id).size
          reclamacao = Reclamacao.create(texto: message, history_id: historyid, position: position, reclamacao_owner_id: email.thread_id, message_id: id)

          # Criar ticket em posição 0 ("zero")
          if (position == 0)
            # crarTicket(reclamacao)
          end
          puts "------MESSAGE END-------"
        end
      end
    end

    def messageByLabel
      result = service.list_user_messages @user_id, label_ids: ["Label_6032676558846782679"]
      puts "Messages:"
      puts "No Messages found" if result.messages.empty?

      result.messages.each { |label| 
        putsemail(label.id) # Old
      }
    end

    def messageByHistoryId(historyid)
      ## Verificar esse if
      # if Reclamacao.where(history_id: historyid).size > 0
        # puts "------------ No new Message ------------------------------"
      # else
        # sleep 70
      puts "Searching message ..."
      response = @service.list_user_histories(@user_id, start_history_id: historyid)
      puts "----------------------------"

      if response.history != nil
        response.history.each do |history_item|
          
          # mensagens adicionadas
          if history_item.messages_added != nil
            puts "+-+-+ New Message +-+-+"
            history_item.messages_added.each do |new_message|
              putsemail(new_message.message.id, historyid)
            end
          end

          # mensagens modificadas
          if history_item.messages != nil
            puts "+-+-+ Message +-+-+"
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
      puts "----------------------------"
      puts "End of Message ------------------------------"
      # end
    end

    # def putssubscription
    #   subscription = @pubsub.subscription 'reclamacao-sub'
    #   subscriber   = subscription.listen do |received_message|
    #     received_message.acknowledge!
    #     puts "++++++++++++++++++++++++++++"
    #     puts "Received message: #{received_message.data}"
    #     history_id = JSON.parse(received_message.data)["historyId"]
    #     messageByHistoryId(history_id)
    #   end

    #   subscriber.start
    #   # Let the main thread sleep for 60 seconds so the thread for listening
    #   # messages does not quit
    #   # sleep 800
    #   subscriber.stop.wait!
    # end
  end
end