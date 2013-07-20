require 'faraday'
require 'shopify_client/error/client_error'
require 'shopify_client/error/server_error'

module ShopifyClient
  module Response

    class RaiseError < Faraday::Response::Middleware

      def on_complete(env)
        case env[:status]
        when 400..499
          raise ShopifyClient::Error::ClientError.from_response(env)
        when 500..599
          raise ShopifyClient::Error::ServerError.from_response(env)
        end
      end

    end

  end
end

