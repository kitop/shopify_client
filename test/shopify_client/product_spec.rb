describe ShopifyClient::Product do

  before do
    @product =  ShopifyClient::Product.new({ :body_html => "<p>It's the small iPod with one very big idea</p>",
                                             :handle => "ipod-nano",
                                             :id => 632910392,
                                             :product_type => "Cult Products",
                                             :published_at => "2007-12-31T19:00:00-05:00",
                                             :published_scope => "global",
                                             :title => "IPod Nano - 8GB"
                                            })

  end

  describe "#handle" do
    it "returns the product's handle" do
      @product.handle.must_equal 'ipod-nano'
    end
  end

end
