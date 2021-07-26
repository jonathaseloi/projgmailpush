module Api::Google
  class PushNotificationService
    attr_reader :id

    def initialize(id)
      @id = id
    end

    def process
      @service = Api::Google::AuthenticationService.run

      # CheckmailWorker.perform_in(5.minutes, id)
    end

    private 

    def authorize
      @service = Api::Google::AuthenticationService.run
    end

    # def reply(user_id, subject, to, body, thread_id)
    #   message              = Mail.new
    #   message.date         = Time.now
    #   message.subject      = "#{subject}"
    #   message.from         = token.email
    #   message.to           = "#{to}"

    #   message.part content_type: 'multipart/alternative' do |part|
    #     part.html_part = Mail::Part.new(body: "#{body}", content_type: 'text/html; charset=UTF-8')
    #   end

    #   msg = message.encoded

    #   message_object = Google::Apis::GmailV1::Message.new(raw:message.to_s, thread_id:thread_id, content_type: 'message/rfc822')
    #   gmail.send_user_message('me', message_object)
    # end
  end
end