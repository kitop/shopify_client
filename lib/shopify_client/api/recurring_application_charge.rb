require "shopify_client/recurring_application_charge"

module ShopifyClient
  module API

    module RecurringApplicationCharge

      def recurring_application_charges(params = {})
        response = get("recurring_application_charges.json", params)
        ShopifyClient::RecurringApplicationCharge.array_from_response(response)
      end

      def recurring_application_charge(id, params = {})
        response = get("recurring_application_charges/#{id}.json", params)
        ShopifyClient::RecurringApplicationCharge.from_response(response)
      end

    end

  end
end
