require 'faraday'
require 'shopify_client/api/custom_collection'
require 'shopify_client/api/order'
require 'shopify_client/api/product'
require 'shopify_client/api/recurring_application_charge'
require 'shopify_client/api/shop'
require 'shopify_client/api/smart_collection'
require 'shopify_client/api/webhook'
require 'shopify_client/request/content_type'
require 'shopify_client/response/parse_json'
require 'shopify_client/response/raise_error'

module ShopifyClient

  class Client
    include ShopifyClient::API::CustomCollection
    include ShopifyClient::API::Order
    include ShopifyClient::API::Product
    include ShopifyClient::API::RecurringApplicationCharge
    include ShopifyClient::API::Shop
    include ShopifyClient::API::SmartCollection
    include ShopifyClient::API::Webhook

    def self.normalize_url(url)
       myshopify_domain = url.match(/(https?:\/\/)?(.+\.myshopify\.com)/)
       if myshopify_domain
         myshopify_domain = myshopify_domain[2]
         "https://#{myshopify_domain}/admin"
       end
    end

    def initialize(url, token, options = {})
      @token = token
      @url = self.class.normalize_url url
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
        builder.use ShopifyClient::Request::ContentType
        builder.use ShopifyClient::Response::RaiseError
        builder.use ShopifyClient::Response::ParseJson
        builder.adapter Faraday.default_adapter
      end
    end

  end

end
