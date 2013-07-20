describe ShopifyClient::Error::ClientError do

  before do
    @client = ShopifyClient.new("example.myshopify.com", "token")
  end

  describe "when status is 4xx" do
    it "raises ShopifyClient::Error::ClientError" do
      stub_request(:get, "https://example.myshopify.com/admin/shop.json").
                   with(headers: { 'X-Shopify-Access-Token' => "token" }).
                   to_return(status: 401, body: MultiJson.dump({ error: "Unauthorized" }) )

      assert_raises ShopifyClient::Error::ClientError do
        @client.shop
      end
    end
  end

end
