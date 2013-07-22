describe ShopifyClient::API::RecurringApplicationCharge do

  before do
    @client = ShopifyClient.new("example.myshopify.com", "token")
  end

  describe "#recurring_application_charges" do
    it "requests all recurring application charges" do
      stubbed = stub_request(:get, "https://example.myshopify.com/admin/recurring_application_charges.json").
                            with(headers: { 'X-Shopify-Access-Token' => "token" }).
                            to_return(status: 200, body: '')

      @client.recurring_application_charges

      assert_requested stubbed
    end

    it "returns an ShopifyClient::RecurringApplicationCharge array" do
      stub_request(:get, "https://example.myshopify.com/admin/recurring_application_charges.json").
                  with(headers: { 'X-Shopify-Access-Token' => "token" }).
                  to_return(status: 200, body: fixture('recurring_application_charges.json'))

      recurring_application_charges = @client.recurring_application_charges

      recurring_application_charges.size.must_equal 2
      recurring_application_charges.first.must_be_instance_of ShopifyClient::RecurringApplicationCharge
    end
  end

  describe "#current_recurring_application_charge" do
    it "returns an 'active' charge" do
      stub_request(:get, "https://example.myshopify.com/admin/recurring_application_charges.json").
                  with(headers: { 'X-Shopify-Access-Token' => "token" }).
                  to_return(status: 200, body: fixture('recurring_application_charges.json'))

      current = @client.current_recurring_application_charge

      current.status.must_equal 'active'
    end
  end

  describe "#recurring_application_charge" do
    it "requests an specific recurring application charge" do
      stubbed = stub_request(:get, "https://example.myshopify.com/admin/recurring_application_charges/123.json").
                            with(headers: { 'X-Shopify-Access-Token' => "token" }).
                            to_return(status: 200, body: '')

      @client.recurring_application_charge(123)

      assert_requested stubbed
    end

    it "returns a ShopifyClient::RecurringApplicationCharge" do
      stub_request(:get, "https://example.myshopify.com/admin/recurring_application_charges/123.json").
                   with(headers: { 'X-Shopify-Access-Token' => "token" }).
                   to_return(status: 200, body: fixture('recurring_application_charge.json'))

      recurring_application_charge = @client.recurring_application_charge(123)

      recurring_application_charge.must_be_instance_of ShopifyClient::RecurringApplicationCharge
    end
  end

  describe "#create_recurring_application_charge" do
    before do
      @attributes = { name: "Super Duper Plan", price: 10.0, return_url: "http://super-duper.shopifyapps.com" }
      @request = stub_request(:post, "https://example.myshopify.com/admin/recurring_application_charges.json").
                            with(headers: { 'X-Shopify-Access-Token' => "token" },
                                 body: { recurring_application_charge:  @attributes }).
                            to_return(status: 200, body: fixture('recurring_application_charge.json'))
    end

    it "posts with recurring_application_charge params" do
      @client.create_recurring_application_charge(@attributes)

      assert_requested @request
    end

    it "returns an initialized RecurringApplicationCharge" do
      recurring_application_charge = @client.create_recurring_application_charge(@attributes)

      recurring_application_charge.must_be_instance_of ShopifyClient::RecurringApplicationCharge
      recurring_application_charge.id.must_equal 455696195
    end

    it "raises an error if 422 returned" do
      @request = stub_request(:post, "https://example.myshopify.com/admin/recurring_application_charges.json").
                            with(headers: { 'X-Shopify-Access-Token' => "token" }).
                            to_return(status: 422 , body: '{"error": "Price must be present"}')

      assert_raises ShopifyClient::Error::ClientError do
        @client.create_recurring_application_charge({ name: "Super Duper Plan", return_url: "http://super-duper.shopifyapps.com" })
      end
    end

  end

  describe "#activate_recurring_application_charge" do
    before do
      @request = stub_request(:post, "https://example.myshopify.com/admin/recurring_application_charges/123/activate.json").
                            with(headers: { 'X-Shopify-Access-Token' => "token" }).
                            to_return(status: 200)
    end

    it "posts to activate charge" do
      @client.activate_recurring_application_charge(123)

      assert_requested @request
    end
  end

  describe "#cancel_recurring_application_charge" do
    before do
      @request = stub_request(:delete, "https://example.myshopify.com/admin/recurring_application_charges/123.json").
                            with(headers: { 'X-Shopify-Access-Token' => "token" }).
                            to_return(status: 200)
    end

    it "deletes to cancel charge" do
      @client.cancel_recurring_application_charge(123)

      assert_requested @request
    end
  end

end
