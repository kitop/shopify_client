describe ShopifyClient::Order do

  before do
    @order =  ShopifyClient::Order.new({ :buyer_accepts_marketing => false,
                                         :cancel_reason => nil,
                                         :cancelled_at => nil,
                                         :cart_token => "68778783ad298f1c80c3bafcddeea02f",
                                         :checkout_token => nil,
                                         :closed_at => nil,
                                         :confirmed => false,
                                         :created_at => "2008-01-10T11:00:00-05:00",
                                         :currency => "USD",
                                         :email => "bob.norman@hostmail.com",
                                         :financial_status => "authorized",
                                         :fulfillment_status => nil,
                                         :gateway => "authorize_net",
                                         :id => 450789469,
                                         :landing_site => "http://www.example.com?source=abc"
                                       })

  end

  describe "#financial_status" do
    it "returns the order's financial_status" do
      @order.financial_status.must_equal 'authorized'
    end
  end

end

