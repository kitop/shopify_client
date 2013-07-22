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

      def activate_recurring_application_charge(id_or_object)
        id = id_or_object.is_a?(ShopifyClient::RecurringApplicationCharge) ? id_or_object.id : id_or_object
        post("recurring_application_charges/#{id}/activate.json")
        true
      end

      def cancel_recurring_application_charge(id_or_object)
        id = id_or_object.is_a?(ShopifyClient::RecurringApplicationCharge) ? id_or_object.id : id_or_object
        delete("recurring_application_charges/#{id}.json")
        true
      end

    end

  end
end
