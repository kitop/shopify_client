require 'shopify_client/base'

module ShopifyClient

  class RecurringApplicationCharge < Base

    hattr_reader :activated_on, :billing_on, :cancelled_on, :confirmation_url,
                 :created_at, :id, :name, :price, :return_url, :status, :test,
                 :trial_days, :trial_ends_on, :updated_at
    def self.single_name
      :recurring_application_charge
    end

    def self.plural_name
      :recurring_application_charges
    end

  end

end
