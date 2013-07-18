describe ShopifyClient::Client do

  describe ".normalize_url" do
    %w{ example.myshopify.com http://example.myshopify.com https://example.myshopify.com example.myshopify.com/admin }.each do |url|
      it "normalizes https:// and /admin" do
        normalized = ShopifyClient::Client.normalize_url url
        normalized.must_equal "https://example.myshopify.com/admin"
      end
    end
  end

end
