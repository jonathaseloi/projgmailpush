require "google/apis/gmail_v1"
require "googleauth"
require "googleauth/stores/file_token_store"
require "fileutils"
require "google/cloud/pubsub"
require "base64"

module Api::Google
  class AuthenticationService
    attr_reader :id

    OOB_URI = "urn:ietf:wg:oauth:2.0:oob".freeze
    APPLICATION_NAME = "Gmail API Ruby Quickstart".freeze
    CREDENTIALS_PATH = "credentials.json".freeze
    # The file token.yaml stores the user's access and refresh tokens, and is
    # created automatically when the authorization flow completes for the first
    # time.
    TOKEN_PATH = "token.yaml".freeze
    SCOPE = [Google::Apis::GmailV1::AUTH_GMAIL_READONLY, Google::Apis::GmailV1::AUTH_GMAIL_SEND, Google::Apis::GmailV1::AUTH_GMAIL_LABELS]

    ##
    # Ensure valid credentials, either by restoring from the saved credentials
    # files or intitiating an OAuth2 authorization. If authorization is required,
    # the user's default browser will be launched to approve the request.
    #
    # @return [Google::Auth::UserRefreshCredentials] OAuth2 credentials

    def self.run
      new.run
    end

    def run
      process
    end

    def process
      # Initialize the API
      @pubsub = Google::Cloud::PubSub.new
      @service = Google::Apis::GmailV1::GmailService.new
      @service.client_options.application_name = APPLICATION_NAME
      @service.authorization = authorize

      # Show the user's labels
      @user_id = "me"

      # authorize

      @service
    end

    def authorize
      client_id = Google::Auth::ClientId.from_file CREDENTIALS_PATH
      token_store = Google::Auth::Stores::FileTokenStore.new file: TOKEN_PATH
      authorizer = Google::Auth::UserAuthorizer.new client_id, SCOPE, token_store
      user_id = "default"
      credentials = authorizer.get_credentials user_id
      if credentials.nil?
        url = authorizer.get_authorization_url base_url: OOB_URI
        puts "Open the following URL in the browser and enter the " \
            "resulting code after authorization:\n" + url
        code = gets
        credentials = authorizer.get_and_store_credentials_from_code(
          user_id: user_id, code: code, base_url: OOB_URI
        )
      end

      credentials
    end
  end
end