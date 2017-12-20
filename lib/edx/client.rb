require 'json'
require 'uri'
require 'faraday'
require 'faraday_middleware'

module Edx
  class Client
    attr_reader :access_token

    def initialize(client:, authenticator:)
      @client = client
      @authenticator = authenticator
      @access_token = authenticator.authenticate
    end

    def authenticated?
      !access_token.nil?
    end

    def get(url, data = nil)
      @client.get(url, data) do |req|
        req.headers['Authorization'] = token_header
      end
    end

    def post(url, data = nil)
      @client.post(url, data) do |req|
        req.headers['Authorization'] = token_header
      end
    end

    private

    def token_header
      @token_header = "JWT #{access_token}"
    end
  end
end
