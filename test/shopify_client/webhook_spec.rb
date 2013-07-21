describe ShopifyClient::Webhook do

  before do
    @webhook =  ShopifyClient::Webhook.new({ :address => "http://apple.com",
                                             :created_at => "2013-07-18T13:55:43-04:00",
                                             :format => "json",
                                             :id => 4759306,
                                             :topic => "orders/create",
                                             :updated_at => "2013-07-18T13:55:43-04:00"
                                            })

  end

  describe "#topic" do
    it "returns the webhook's topic" do
      @webhook.topic.must_equal 'orders/create'
    end
  end

end


