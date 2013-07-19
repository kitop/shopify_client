describe ShopifyClient::API::CustomCollection do

  before do
    @client = ShopifyClient.new("example.myshopify.com", "token")
  end

  describe "#custom_collections" do
    it "requests all custom collections" do
      stubbed = stub_request(:get, "https://example.myshopify.com/admin/custom_collections.json").
                            with(headers: { 'X-Shopify-Access-Token' => "token" }).
                            to_return(status: 200, body: '')

      @client.custom_collections

      assert_requested stubbed
    end
  end

  describe "#custom_collection" do
    it "requests an specific custom collection" do
      stubbed = stub_request(:get, "https://example.myshopify.com/admin/custom_collections/123.json").
                            with(headers: { 'X-Shopify-Access-Token' => "token" }).
                            to_return(status: 200, body: '')

      @client.custom_collection(123)

      assert_requested stubbed
    end

    it "returns a ShopifyClient::CustomCollection" do
      stub_request(:get, "https://example.myshopify.com/admin/custom_collections/123.json").
                   with(headers: { 'X-Shopify-Access-Token' => "token" }).
                   to_return(status: 200, body: fixture('custom_collection.json'))

      custom_collection = @client.custom_collection(123)

      custom_collection.must_be_instance_of ShopifyClient::CustomCollection
    end
  end

end

