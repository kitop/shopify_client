require 'shopify_client/base'

module ShopifyClient

  class Product < Base

    hattr_reader :body_html, :created_at, :handle, :id, :image, :images,
                 :options, :product_type, :published_at, :published_scope,
                 :tags, :template_suffix, :title, :updated_at, :variants,
                 :vendor

    def self.single_name
      :product
    end

    def self.plural_name
      :products
    end

  end

end
