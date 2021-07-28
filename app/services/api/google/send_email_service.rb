module Api::Google
  class SendEmailService
    attr_reader :thread_id, :to, :message_body

    def initialize(reclamacao_owner_id, to, message_body)
      @thread_id = reclamacao_owner_id
      @to = to
      @message_body = message_body
    end

    def process
      authorize
      SendmailWorker.perform_async(thread_id, to, message_body)
    end

    private 

    def authorize
      @service = Api::Google::AuthenticationService.run
    end
  end
end