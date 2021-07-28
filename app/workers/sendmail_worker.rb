class SendmailWorker
  include Sidekiq::Worker

  def perform(thread_id, to, message_body)
    authorize
    reply(thread_id, to, message_body)
  end

  def authorize
    @service = Api::Google::AuthenticationService.run
  end

  def reply(reclamacao_owner_id, to, message_body)
    gmail = Google::Apis::GmailV1::GmailService.new
    gmail.authorization = authorize

    message              = Mail.new
    message.date         = Time.now
    message.subject      = "teste"
    message.from         = "SYSTEM"
    message.to           = to

    message.part content_type: 'multipart/alternative' do |part|
      part.html_part = Mail::Part.new(body: message_body, content_type: 'text/html; charset=UTF-8')
    end

    msg = message.encoded

    message_object = Google::Apis::GmailV1::Message.new(raw:message.to_s, thread_id:reclamacao_owner_id, content_type: 'message/rfc822')
    @service.send_user_message('me', message_object)
  end
end
