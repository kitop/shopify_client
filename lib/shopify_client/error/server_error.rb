require 'shopify_client/error'

module ShopifyClient
  class Error

    class ServerError < ShopifyClient::Error

      def self.from_response(response)
        new "Server Error", response[:status]
      end

    end

  end
end
