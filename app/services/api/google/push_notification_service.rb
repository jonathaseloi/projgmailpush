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
  end
end