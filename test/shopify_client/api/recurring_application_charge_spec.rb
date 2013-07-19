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

      recurring_application_charges.size.must_equal 1
      recurring_application_charges.first.must_be_instance_of ShopifyClient::RecurringApplicationCharge
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

end
