require 'shopify_client/base'

module ShopifyClient

  class SmartCollection < Base

    hattr_reader :body_html, :handle, :id, :image, :products_count,
                 :published_at, :published_scope, :rules, :sort_order,
                 :template_suffix, :title, :updated_at

    def self.single_name
      :smart_collection
    end

    def self.plural_name
      :smart_collections
    end

  end

end


