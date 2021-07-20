module Api::Google
  class PushNotificationService
    attr_reader :id

    def initialize(id)
      @id = id
    end

    def process
      # MailCheckJob.perform_later id
      CheckmailWorker.perform_in(5.minutes, id)
    end

    def watch
      authorize
      teste
    end

    private 

    def authorize
      @service = Api::Google::AuthenticationService.run
    end

    def teste
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
end