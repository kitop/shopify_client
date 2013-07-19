require "shopify_client/product"

module ShopifyClient
  module API

    module Product

      def products(params = {})
        response = get("products.json", params)
        ShopifyClient::Product.array_from_response(response)
      end

      def product(id, params = {})
        response = get("products/#{id}.json", params)
        ShopifyClient::Product.from_response(response)
      end

    end

  end
end
