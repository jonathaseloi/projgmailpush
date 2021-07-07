# require "google/apis/gmail_v1"
# require "googleauth"
# require "googleauth/stores/file_token_store"
# require "fileutils"
# require "google/cloud/pubsub"
# require "base64"
module Api::Google
  class PushNotificationService
    attr_reader :id
    #########
    #export GOOGLE_APPLICATION_CREDENTIALS="/home/jonathas/Documentos/ibc/projgmailpush/projgmailpush/proj-gmail-push-af9ed62bd0d6.json"
    #########
    # OOB_URI = "urn:ietf:wg:oauth:2.0:oob".freeze
    # APPLICATION_NAME = "Gmail API Ruby Quickstart".freeze
    # CREDENTIALS_PATH = "credentials.json".freeze
    # # The file token.yaml stores the user's access and refresh tokens, and is
    # # created automatically when the authorization flow completes for the first
    # # time.
    # TOKEN_PATH = "token.yaml".freeze
    # SCOPE = Google::Apis::GmailV1::AUTH_GMAIL_READONLY

    # ##
    # # Ensure valid credentials, either by restoring from the saved credentials
    # # files or intitiating an OAuth2 authorization. If authorization is required,
    # # the user's default browser will be launched to approve the request.
    # #
    # # @return [Google::Auth::UserRefreshCredentials] OAuth2 credentials
    # # Initialize the API
    # @pubsub = Google::Cloud::Pubsub.new
    # @service = Google::Apis::GmailV1::GmailService.new
    # @service.client_options.application_name = APPLICATION_NAME
    # @service.authorization = authorize

    # # Show the user's labels
    # @user_id = "me"


    def initialize(id)
      @id = id
    end

    def process
      authorize
      messageByHistoryId(id)
    end

    private

    # def authorize
    #   client_id = Google::Auth::ClientId.from_file CREDENTIALS_PATH
    #   token_store = Google::Auth::Stores::FileTokenStore.new file: TOKEN_PATH
    #   authorizer = Google::Auth::UserAuthorizer.new client_id, SCOPE, token_store
    #   user_id = "default"
    #   credentials = authorizer.get_credentials user_id
    #   if credentials.nil?
    #     url = authorizer.get_authorization_url base_url: OOB_URI
    #     puts "Open the following URL in the browser and enter the " \
    #         "resulting code after authorization:\n" + url
    #     code = gets
    #     credentials = authorizer.get_and_store_credentials_from_code(
    #       user_id: user_id, code: code, base_url: OOB_URI
    #     )
    #   end

    #   credentials
    # end

    ###############################################
    def authorize
      @service = Api::Google::AuthenticationService.run
    end

    def messageModificate(message)
      index_cut = message.index("> ")

      # Remove all conversation in responses
      if index_cut.present? && index_cut > 0
        message = message[0..index_cut]
      end

      message = message.gsub! "\r", ""
      message = message.gsub! "\n", " "

      # pegar posição da data para remover
      positions = message.enum_for(:scan, /Em .{3}\.,/).map{Regexp.last_match.begin(0)}
      message = message[0..positions.first-1]
      message
    end

    def putsemail(id, historyid)
      if Pubsub.where(messageid: id).size <= 0
        begin
          sleep 70
          email = @service.get_user_message "me", id
        rescue => each
          email = nil
        end
        # puts "- #{JSON.parse body.payload.body.data
        # puts email.payload.parts.to_json
        # puts email.payload.body.to_json
        # puts email.to_json
        
        # if email.payload.body
          # always print the first content type body, usually plain text
                # puts email.snippet
      # end
        if email != nil && email.payload.parts.first.body.data != nil
          puts "-----MESSAGE BEGIN--------"
          message = email.payload.parts.first.body.data.force_encoding("UTF-8")
          message = messageModificate(message)

          puts message

          Pubsub.create(historyid: historyid, messageid: id, texto: message)
          
          puts "------MESSAGE END-------"
        end
      end
    end

    ##################################################

    def messageByLabel
      result = service.list_user_messages @user_id, label_ids: ["Label_6032676558846782679"]
      puts "Messages:"
      puts "No Messages found" if result.messages.empty?

      result.messages.each { |label| 
        putsemail(label.id) # Old
      }
    end
    # request = {
    #   'labelIds': ['EU'],
    #   'topicName': 'projects/proj-gmail-push/topics/reclamacao-sub'
    # }
    # watch_request = Google::Apis::GmailV1::WatchRequest.new
    # watch_request.topic_name= 'projects/proj-gmail-push/topics/reclamacao'
    # response = service.watch_user(userId='me', body=watch_request) do |request|
    #   puts request.history_id
    #   puts request.expiration
    # end

    def messageByHistoryId(historyid)
      if Pubsub.where(historyid: historyid).size > 0
        puts "------------ No new Message ------------------------------"
      else
        sleep 70
        puts "Searching message ..."
        response = @service.list_user_histories(@user_id, start_history_id: historyid)
        puts "----------------------------"
        #salvar novo historyId
        if response.history != nil
          response.history.each do |history_item|
            
            # mensagens adicionadas
            # Se quiser só a ultima mensagem pegar o last, caso contrario trará todas as mensagens dentro de mensagens
            if history_item.messages_added != nil
              puts "+-+-+ New Message +-+-+"
              history_item.messages_added.each do |new_message|
                putsemail(new_message.message.id, historyid)
              end
            end

            # mensagens modificadas
            # Se quiser só a ultima mensagem pegar o last, caso contrario trará todas as mensagens dentro de mensagens
            if history_item.messages != nil
              puts "+-+-+ Message +-+-+"
              history_item.messages.each do |message|
                putsemail(message.id, historyid)
              end
            end

            # mensagens deletadas
            if history_item.messages_deleted != nil
              puts "+-+-+ Deleted Message +-+-+"
              history_item.messages.each do |message|
                putsemail(message.id, historyid)
              end
            end
          end
        end
        puts "----------------------------"
        puts "End of Message ------------------------------"
      end
    end

    # messageByHistoryId(2140351)

    def putssubscription
      subscription = @pubsub.subscription 'reclamacao-sub'
      subscriber   = subscription.listen do |received_message|
        received_message.acknowledge!
        puts "++++++++++++++++++++++++++++"
        puts "Received message: #{received_message.data}"
        history_id = JSON.parse(received_message.data)["historyId"]
        messageByHistoryId(history_id)
      end

      subscriber.start
      # Let the main thread sleep for 60 seconds so the thread for listening
      # messages does not quit
      sleep 800
      subscriber.stop.wait!
    end

    # putssubscription
  end
end