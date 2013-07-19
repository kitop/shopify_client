describe ShopifyClient::RecurringApplicationCharge do

  before do
    @recurring_application_charge =  ShopifyClient::RecurringApplicationCharge.new({ :id => 455696195,
                                                                                     :name => "Super Mega Plan",
                                                                                     :price => "15.00",
                                                                                     :return_url => "http://yourapp.com",
                                                                                     :status => "pending"
                                                                                   })


  end

  describe "#name" do
    it "returns the recurring_application_charge's name " do
      @recurring_application_charge.name.must_equal 'Super Mega Plan'
    end
  end

end
