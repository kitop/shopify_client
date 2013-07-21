describe ShopifyClient::API::Webhook do

  before do
    @client = ShopifyClient.new("example.myshopify.com", "token")
  end

  describe "#webhooks" do
    it "requests all webhooks" do
      stubbed = stub_request(:get, "https://example.myshopify.com/admin/webhooks.json").
                            with(headers: { 'X-Shopify-Access-Token' => "token" }).
                            to_return(status: 200, body: '')

      @client.webhooks

      assert_requested stubbed
    end

    it "filters by financial_status" do
      stubbed = stub_request(:get, "https://example.myshopify.com/admin/webhooks.json?financial_status=authorized").
                            with(headers: { 'X-Shopify-Access-Token' => "token" }).
                            to_return(status: 200, body: '')

      @client.webhooks(:financial_status => :authorized)

      assert_requested stubbed
    end


    it "returns an ShopifyClient::Webhook array" do
      stub_request(:get, "https://example.myshopify.com/admin/webhooks.json").
                  with(headers: { 'X-Shopify-Access-Token' => "token" }).
                  to_return(status: 200, body: fixture('webhooks.json'))

      webhooks = @client.webhooks

      webhooks.size.must_equal 2
      webhooks.first.must_be_instance_of ShopifyClient::Webhook
    end

  end

  describe "#webhook" do
    it "requests an specific webhook" do
      stubbed = stub_request(:get, "https://example.myshopify.com/admin/webhooks/123.json").
                            with(headers: { 'X-Shopify-Access-Token' => "token" }).
                            to_return(status: 200, body: '')

      @client.webhook(123)

      assert_requested stubbed
    end

    it "returns a ShopifyClient::Webhook" do
      stub_request(:get, "https://example.myshopify.com/admin/webhooks/123.json").
                   with(headers: { 'X-Shopify-Access-Token' => "token" }).
                   to_return(status: 200, body: fixture('webhook.json'))

      webhook = @client.webhook(123)

      webhook.must_be_instance_of ShopifyClient::Webhook
      webhook.format.must_equal "json"
    end
  end

end




