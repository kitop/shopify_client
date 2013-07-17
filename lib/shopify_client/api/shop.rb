require 'shopify_client/shop'

module ShopifyClient
  module API

    module Shop

      def shop(params = {})
        response = get('shop.json', params)
        ShopifyClient::Shop.from_response(response)
      end

    end

  end
end
