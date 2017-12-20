module Edx
  class Authenticator
    AUTH_URL = 'https://api.edx.org/oauth2/v1/access_token'.freeze

    attr_reader :access_token

    class AuthenticationError < StandardError; end

    def initialize(connection:, client_id:, client_secret:)
      @client_id = client_id
      @client_secret = client_secret
      @connection = connection
    end

    def authenticate
      response = @connection.post(AUTH_URL, auth_data) do |req|
        req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
      end
      raise AuthenticationError, 'Failed to authenticate with EdX API!' unless response.status == 200
      @access_token = response.body['access_token']
    end

    def refresh
      # TODO: refresh access token
    end

    private

    def auth_data
      URI.encode_www_form(
        grant_type: :client_credentials,
        client_id: @client_id,
        client_secret: @client_secret,
        token_type: :jwt
      )
    end
  end
end
