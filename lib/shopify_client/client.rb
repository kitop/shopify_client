require 'faraday'
require 'shopify_client/api/shop'
require 'shopify_client/response/parse_json'

module ShopifyClient

  class Client
    include ShopifyClient::API::Shop

    def initialize(url, token, options = {})
      @token = token
      @url = url
    end

    # Perform an HTTP GET request
    def get(path, params={})
      request(:get, path, params)
    end

    # Perform an HTTP POST request
    def post(path, params={})
      request(:post, path, params)
    end

    # Perform an HTTP PUT request
    def put(path, params={})
      request(:put, path, params)
    end

    # Perform an HTTP DELETE request
    def delete(path, params={})
      request(:delete, path, params)
    end

    private

    def request(method, path, params)
      connection.send(method.to_sym, path, params).env
    end

    def connection
      @connection ||= Faraday.new(@url, connection_options)
    end

    def connection_options
      {
        :headers => {
          :accept => 'application/json',
          :user_agent => "ShopifyClient Ruby Gem #{ShopifyClient::VERSION}",
          'X-Shopify-Access-Token' => @token
        },
        :builder => connection_middleware
      }
    end

    def connection_middleware
      @builder ||= Faraday::Builder.new do |builder|
        builder.use ShopifyClient::Response::ParseJson
        builder.adapter Faraday.default_adapter
      end
    end

  end

end
