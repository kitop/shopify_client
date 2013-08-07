require 'shopify_client/base'

module ShopifyClient

  class ScriptTag < Base

    hattr_reader :created_at, :event, :id, :src, :updated_at

    def self.single_name
      :script_tag
    end

    def self.plural_name
      :script_tags
    end

  end

end
