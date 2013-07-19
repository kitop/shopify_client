require "shopify_client/custom_collection"

module ShopifyClient
  module API

    module CustomCollection

      def custom_collections(params = {})
        response = get("custom_collections.json", params)
        ShopifyClient::CustomCollection.array_from_response(response)
      end

      def custom_collection(id, params = {})
        response = get("custom_collections/#{id}.json", params)
        ShopifyClient::CustomCollection.from_response(response)
      end

    end

  end
end

