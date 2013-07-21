require 'shopify_client/base'

module ShopifyClient

  class Webhook < Base

    hattr_reader :address, :created_at, :format, :id, :topic, :updated_at

    def self.single_name
      :webhook
    end

    def self.plural_name
      :webhooks
    end

  end

end


