require 'shopify_client/base'

module ShopifyClient

  class CustomCollection < Base

    hattr_reader :body_html, :handle, :id, :image, :products_count, :published_at,
                 :published_scope, :sort_order, :template_suffix, :title, :updated_at

    def self.single_name
      :custom_collection
    end

    def self.plural_name
      :custom_collections
    end

  end

end

