require 'shopify_client/base'

module ShopifyClient

  class Shop < Base

    hattr_reader :address1, :city, :country, :country_code, :country_name,
                 :created_at, :currency, :customer_email, :domain, :email,
                 :google_apps_domain, :google_apps_login_enabled, :id,
                 :latitude, :longitude, :money_format, :money_in_emails_format,
                 :money_with_currency_format, :money_with_currency_in_emails_format,
                 :myshopify_domain, :name, :phone, :plan_display_name, :plan_name,
                 :province, :province_code, :public, :shop_owner, :source,
                 :tax_shipping, :taxes_included, :timezone, :zip

    def single_name
      :shop
    end

  end

end
