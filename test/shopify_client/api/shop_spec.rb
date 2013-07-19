describe ShopifyClient::API::Shop do

  before do
    @client = ShopifyClient.new("example.myshopify.com", "token")
  end

  describe "#shop" do
    it "requests the current shop" do
      stubbed = stub_request(:get, "https://example.myshopify.com/admin/shop.json").
                            with(headers: { 'X-Shopify-Access-Token' => "token" }).
                            to_return(status: 200, body: '')

      @client.shop

      assert_requested stubbed
    end

    it "returns a ShopifyClient::Shop instance with data" do
      stub_request(:get, "https://example.myshopify.com/admin/shop.json").
                  with(headers: { 'X-Shopify-Access-Token' => "token" }).
                  to_return(status: 200, body: fixture('shop.json'))

      shop = @client.shop

      shop.must_be_instance_of ShopifyClient::Shop
      shop.name.must_equal "Apple Computers"
    end
  end

end
