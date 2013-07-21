describe ShopifyClient::API::Order do

  before do
    @client = ShopifyClient.new("example.myshopify.com", "token")
  end

  describe "#orders" do
    it "requests all orders" do
      stubbed = stub_request(:get, "https://example.myshopify.com/admin/orders.json").
                            with(headers: { 'X-Shopify-Access-Token' => "token" }).
                            to_return(status: 200, body: '')

      @client.orders

      assert_requested stubbed
    end

    it "filters by financial_status" do
      stubbed = stub_request(:get, "https://example.myshopify.com/admin/orders.json?financial_status=authorized").
                            with(headers: { 'X-Shopify-Access-Token' => "token" }).
                            to_return(status: 200, body: '')

      @client.orders(:financial_status => :authorized)

      assert_requested stubbed
    end


    it "returns an ShopifyClient::Order array" do
      stub_request(:get, "https://example.myshopify.com/admin/orders.json").
                  with(headers: { 'X-Shopify-Access-Token' => "token" }).
                  to_return(status: 200, body: fixture('orders.json'))

      orders = @client.orders

      orders.size.must_equal 1
      orders.first.must_be_instance_of ShopifyClient::Order
    end

  end

  describe "#order" do
    it "requests an specific order" do
      stubbed = stub_request(:get, "https://example.myshopify.com/admin/orders/123.json").
                            with(headers: { 'X-Shopify-Access-Token' => "token" }).
                            to_return(status: 200, body: '')

      @client.order(123)

      assert_requested stubbed
    end

    it "returns a ShopifyClient::Order" do
      stub_request(:get, "https://example.myshopify.com/admin/orders/123.json").
                   with(headers: { 'X-Shopify-Access-Token' => "token" }).
                   to_return(status: 200, body: fixture('order.json'))

      order = @client.order(123)

      order.must_be_instance_of ShopifyClient::Order
      order.cart_token.must_equal "68778783ad298f1c80c3bafcddeea02f"
    end
  end

end



