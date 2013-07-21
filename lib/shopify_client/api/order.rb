require "shopify_client/order"

module ShopifyClient
  module API

    module Order

      def orders(params = {})
        response = get("orders.json", params)
        ShopifyClient::Order.array_from_response(response)
      end

      def order(id, params = {})
        response = get("orders/#{id}.json", params)
        ShopifyClient::Order.from_response(response)
      end

    end

  end
end

