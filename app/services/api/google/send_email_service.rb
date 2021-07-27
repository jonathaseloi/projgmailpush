module Api::Google
  class SendEmailService
    attr_reader :thread_id

    def initialize(reclamacao_owner_id)
      @thread_id = reclamacao_owner_id
    end

    def process
      authorize
      reply(thread_id)
      # CheckmailWorker.perform_in(5.minutes, id)
    end

    private 

    def authorize
      @service = Api::Google::AuthenticationService.run
    end

    def reply(reclamacao_owner_id)
      message              = Mail.new
      message.date         = Time.now
      message.subject      = "teste"
      message.from         = token.email
      message.to           = "jonathaseloi@gmail.com"

      message.part content_type: 'multipart/alternative' do |part|
        part.html_part = Mail::Part.new(body: "testeeeeeeeeeeee", content_type: 'text/html; charset=UTF-8')
      end

      msg = message.encoded

      message_object = Google::Apis::GmailV1::Message.new(raw:message.to_s, thread_id:reclamacao_owner_id, content_type: 'message/rfc822')
      gmail.send_user_message('me', message_object)
    end
  end
end