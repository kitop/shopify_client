require 'shopify_client/base'

module ShopifyClient

  class Image < Base

    hattr_reader :image, :src, :attachment

  end

end


