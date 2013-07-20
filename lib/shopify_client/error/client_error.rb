require 'shopify_client/error'

module ShopifyClient
  class Error

    class ClientError < ShopifyClient::Error

      def self.from_response(response)
        new parse_error(response[:body]), response[:status]
      end

      def self.parse_error(body)
        if body.nil?
          ''
        else
          body[:error]
        end
      end

    end

  end
end
