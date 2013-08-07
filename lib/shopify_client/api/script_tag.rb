require "shopify_client/script_tag"

module ShopifyClient
  module API

    module ScriptTag

      def script_tags(params = {})
        response = get("script_tags.json", params)
        ShopifyClient::ScriptTag.array_from_response(response)
      end

      def script_tag(id, params = {})
        response = get("script_tags/#{id}.json", params)
        ShopifyClient::ScriptTag.from_response(response)
      end

      def create_script_tag(attributes)
        response = post("script_tags.json", script_tag: attributes)
        ShopifyClient::ScriptTag.from_response(response)
      end

      def destroy_script_tag(id_or_object)
        id = id_or_object.is_a?(ShopifyClient::ScriptTag) ? id_or_object.id : id_or_object
        delete("script_tags/#{id}.json")
        true
      end

    end

  end
end



