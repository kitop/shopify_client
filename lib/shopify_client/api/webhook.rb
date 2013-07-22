require "shopify_client/webhook"

module ShopifyClient
  module API

    module Webhook

      def webhooks(params = {})
        response = get("webhooks.json", params)
        ShopifyClient::Webhook.array_from_response(response)
      end

      def webhook(id, params = {})
        response = get("webhooks/#{id}.json", params)
        ShopifyClient::Webhook.from_response(response)
      end

      def create_webhook(attributes)
        response = post("webhooks.json", webhook: attributes)
        ShopifyClient::Webhook.from_response(response)
      end

      def destroy_webhook(id_or_object)
        id = id_or_object.is_a?(ShopifyClient::Webhook) ? id_or_object.id : id_or_object
        delete("webhooks/#{id}.json")
        true
      end

    end

  end
end


