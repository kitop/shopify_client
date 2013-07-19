describe ShopifyClient::API::Product do

  before do
    @client = ShopifyClient.new("example.myshopify.com", "token")
  end

  describe "#products" do
    it "requests all products" do
      stubbed = stub_request(:get, "https://example.myshopify.com/admin/products.json").
                            with(headers: { 'X-Shopify-Access-Token' => "token" }).
                            to_return(status: 200, body: '')

      @client.products

      assert_requested stubbed
    end

    it "filters by collection_id" do
      stubbed = stub_request(:get, "https://example.myshopify.com/admin/products.json?collection_id=456").
                            with(headers: { 'X-Shopify-Access-Token' => "token" }).
                            to_return(status: 200, body: '')

      @client.products(:collection_id => 456)

      assert_requested stubbed
    end


    it "returns an ShopifyClient::Product array" do
      stub_request(:get, "https://example.myshopify.com/admin/products.json").
                  with(headers: { 'X-Shopify-Access-Token' => "token" }).
                  to_return(status: 200, body: fixture('products.json'))

      products = @client.products

      products.size.must_equal 2
      products.first.must_be_instance_of ShopifyClient::Product
    end

  end

  describe "#product" do
    it "requests an specific product" do
      stubbed = stub_request(:get, "https://example.myshopify.com/admin/products/123.json").
                            with(headers: { 'X-Shopify-Access-Token' => "token" }).
                            to_return(status: 200, body: '')

      @client.product(123)

      assert_requested stubbed
    end

    it "returns a ShopifyClient::Product" do
      stub_request(:get, "https://example.myshopify.com/admin/products/123.json").
                   with(headers: { 'X-Shopify-Access-Token' => "token" }).
                   to_return(status: 200, body: fixture('product.json'))

      product = @client.product(123)

      product.must_be_instance_of ShopifyClient::Product
    end
  end

end


