require 'shopify_client/base'

module ShopifyClient

  class Order < Base

    hattr_reader :billing_address, :browser_ip, :buyer_accepts_marketing, :cancel_reason,
                 :cancelled_at, :cart_token, :checkout_id, :checkout_token,
                 :client_details, :closed_at, :confirmed, :created_at, :currency,
                 :customer, :discount_codes, :email, :financial_status, :fulfillment_status,
                 :gateway, :id, :landing_site, :landing_site_ref, :line_items, :location_id,
                 :name, :note, :note_attributes, :number, :order_number, :payment_details,
                 :processing_method, :reference, :referring_site, :shipping_address, :shipping_lines,
                 :source, :subtotal_price, :tax_lines, :taxes_included, :test, :token, :total_discounts,
                 :total_line_items_price, :total_price, :total_price_usd, :total_tax, :total_weight,
                 :updated_at, :user_id

    def self.single_name
      :order
    end

    def self.plural_name
      :orders
    end

  end

end

