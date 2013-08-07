describe ShopifyClient::API::ScriptTag do

  before do
    @client = ShopifyClient.new("example.myshopify.com", "token")
  end

  describe "#script_tags" do
    it "requests all script_tags" do
      stubbed = stub_request(:get, "https://example.myshopify.com/admin/script_tags.json").
                            with(headers: { 'X-Shopify-Access-Token' => "token" }).
                            to_return(status: 200, body: '')

      @client.script_tags

      assert_requested stubbed
    end

    it "filters by topic" do
      stubbed = stub_request(:get, "https://example.myshopify.com/admin/script_tags.json?topic=orders/create").
                            with(headers: { 'X-Shopify-Access-Token' => "token" }).
                            to_return(status: 200, body: '')

      @client.script_tags(:topic => 'orders/create')

      assert_requested stubbed
    end


    it "returns an ShopifyClient::ScriptTag array" do
      stub_request(:get, "https://example.myshopify.com/admin/script_tags.json").
                  with(headers: { 'X-Shopify-Access-Token' => "token" }).
                  to_return(status: 200, body: fixture('script_tags.json'))

      script_tags = @client.script_tags

      script_tags.size.must_equal 2
      script_tags.first.must_be_instance_of ShopifyClient::ScriptTag
    end

  end

  describe "#script_tag" do
    it "requests an specific script_tag" do
      stubbed = stub_request(:get, "https://example.myshopify.com/admin/script_tags/123.json").
                            with(headers: { 'X-Shopify-Access-Token' => "token" }).
                            to_return(status: 200, body: '')

      @client.script_tag(123)

      assert_requested stubbed
    end

    it "returns a ShopifyClient::ScriptTag" do
      stub_request(:get, "https://example.myshopify.com/admin/script_tags/123.json").
                   with(headers: { 'X-Shopify-Access-Token' => "token" }).
                   to_return(status: 200, body: fixture('script_tag.json'))

      script_tag = @client.script_tag(123)

      script_tag.must_be_instance_of ShopifyClient::ScriptTag
      script_tag.src.must_equal "http://js-aplenty.com/foo.js"
    end
  end

  describe "#create_script_tag" do
    before do
      @attributes = { event: "onload", src: "http://js-aplenty.com/foo.js" }
      @request = stub_request(:post, "https://example.myshopify.com/admin/script_tags.json").
                            with(headers: { 'X-Shopify-Access-Token' => "token" },
                                 body: { script_tag:  @attributes }).
                            to_return(status: 200, body: fixture('script_tag.json'))
    end

    it "posts with script_tag params" do
      @client.create_script_tag(@attributes)

      assert_requested @request
    end

    it "returns an initialized ScriptTag" do
      script_tag = @client.create_script_tag(@attributes)

      script_tag.must_be_instance_of ShopifyClient::ScriptTag
      script_tag.id.must_equal 596726825
    end

  end

  describe "#destroy_script_tag" do
    before do
      @request = stub_request(:delete, "https://example.myshopify.com/admin/script_tags/123.json").
                            with(headers: { 'X-Shopify-Access-Token' => "token" }).
                            to_return(status: 200)
    end

    it "deletes to destroy a script_tag" do
      @client.destroy_script_tag(123)

      assert_requested @request
    end

    it "can receive a ShopifyClient::ScriptTag object" do
      @client.destroy_script_tag(ShopifyClient::ScriptTag.new(id: 123))

      assert_requested @request
    end
  end

end
