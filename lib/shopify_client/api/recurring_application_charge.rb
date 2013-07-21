require "shopify_client/recurring_application_charge"

module ShopifyClient
  module API

    module RecurringApplicationCharge

      def recurring_application_charges(params = {})
        response = get("recurring_application_charges.json", params)
        ShopifyClient::RecurringApplicationCharge.array_from_response(response)
      end

      def current_recurring_application_charge(params = {})
        charges = recurring_application_charges(params)
        charges.find{|charge| charge.status == 'active' }
      end

      def recurring_application_charge(id, params = {})
        response = get("recurring_application_charges/#{id}.json", params)
        ShopifyClient::RecurringApplicationCharge.from_response(response)
      end

      def create_recurring_application_charge(attributes)
        response = post("recurring_application_charges.json", recurring_application_charge: attributes)
        ShopifyClient::RecurringApplicationCharge.from_response(response)
      end

    end

  end
end
