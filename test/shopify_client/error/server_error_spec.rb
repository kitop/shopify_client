describe ShopifyClient::Error::ServerError do

  before do
    @client = ShopifyClient.new("example.myshopify.com", "token")
  end

  describe "when status is 4xx" do
    it "raises ShopifyClient::Error::ServerError" do
      stub_request(:get, "https://example.myshopify.com/admin/shop.json").
                   with(headers: { 'X-Shopify-Access-Token' => "token" }).
                   to_return(status: 500)

      assert_raises ShopifyClient::Error::ServerError do
        @client.shop
      end
    end
  end

end

