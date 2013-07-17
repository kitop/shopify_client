require "shopify_client/client"
require "shopify_client/version"

module ShopifyClient

  def self.new(url, token, options = {})
    Client.new url, token
  end

end
