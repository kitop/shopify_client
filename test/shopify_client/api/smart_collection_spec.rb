describe ShopifyClient::API::SmartCollection do

  before do
    @client = ShopifyClient.new("example.myshopify.com", "token")
  end

  describe "#smart_collections" do
    it "requests all smart collections" do
      stubbed = stub_request(:get, "https://example.myshopify.com/admin/smart_collections.json").
                            with(headers: { 'X-Shopify-Access-Token' => "token" }).
                            to_return(status: 200, body: '')

      @client.smart_collections

      assert_requested stubbed
    end

    it "returns an ShopifyClient::SmartCollection array" do
      stub_request(:get, "https://example.myshopify.com/admin/smart_collections.json").
                  with(headers: { 'X-Shopify-Access-Token' => "token" }).
                  to_return(status: 200, body: fixture('smart_collections.json'))

      smart_collections = @client.smart_collections

      smart_collections.size.must_equal 1
      smart_collections.first.must_be_instance_of ShopifyClient::SmartCollection
    end
  end

  describe "#smart_collection" do
    it "requests an specific smart collection" do
      stubbed = stub_request(:get, "https://example.myshopify.com/admin/smart_collections/123.json").
                            with(headers: { 'X-Shopify-Access-Token' => "token" }).
                            to_return(status: 200, body: '')

      @client.smart_collection(123)

      assert_requested stubbed
    end

    it "returns a ShopifyClient::SmartCollection with data" do
      stub_request(:get, "https://example.myshopify.com/admin/smart_collections/123.json").
                   with(headers: { 'X-Shopify-Access-Token' => "token" }).
                   to_return(status: 200, body: fixture('smart_collection.json'))

      smart_collection = @client.smart_collection(123)

      smart_collection.must_be_instance_of ShopifyClient::SmartCollection
      smart_collection.handle.must_equal 'smart-ipods'
    end
  end

end

