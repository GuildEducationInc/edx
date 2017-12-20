require 'json'
require 'uri'
require 'faraday'

module Edx
  class HttpClient
    def initialize
      @connections = {}
    end

    def get(url, data)
      uri = parse_url(url)
      conn = connection_for(uri)
      conn.get do |req|
        req.url uri.request_uri, data
        yield req if block_given?
      end
    end

    def post(url, data)
      uri = parse_url(url)
      conn = connection_for(uri)
      conn.post do |req|
        req.url uri.request_uri
        req.body = data
        yield req if block_given?
      end
    end

    private

    def parse_url(url)
      uri = URI.parse(url)
      uri.path = add_trailing_slash(uri.path)
      uri
    end

    # EdX barfs if you don't include the trailing slash
    def add_trailing_slash(path)
      path[-1] == '/' ? path : path + '/'
    end

    def connection_for(url)
      base = URI.join(url, '/').to_s
      @connections[base] ||= Faraday.new(url) do |f|
        f.request :json
        f.response :json
        f.response :logger
        f.adapter Faraday.default_adapter
      end
    end
  end
end
