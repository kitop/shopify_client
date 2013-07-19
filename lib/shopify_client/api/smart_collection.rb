require "shopify_client/smart_collection"

module ShopifyClient
  module API

    module SmartCollection

      def smart_collections(params = {})
        response = get("smart_collections.json", params)
        ShopifyClient::SmartCollection.array_from_response(response)
      end

      def smart_collection(id, params = {})
        response = get("smart_collections/#{id}.json", params)
        ShopifyClient::SmartCollection.from_response(response)
      end

    end

  end
end

