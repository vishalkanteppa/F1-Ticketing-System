require "ostruct"
class Fakepay
    def self.make_payment(order_id:, payment_type:, payment_details:)
        payment_method = payment_method.to_s.downcase.to_sym
        if payment_type == "SEPA"
            Rails.logger.info "Processing check: " +
                            payment_details.fetch(:iban).to_s + "/" +
                            payment_details.fetch(:bic).to_s
        elsif payment_type == "Credit card"
            Rails.logger.info "Processing credit_card: " +
                            payment_details.fetch(:credit_card_number).to_s + "/" +
                            payment_details.fetch(:expiration_date).to_s + "/" +
                            payment_details.fetch(:cvv).to_s
        elsif payment_type == "Paypal"
            Rails.logger.info "Processing purchase order: " +
                            payment_details.fetch(:wallet_no).to_s
        else
            raise "Unknown payment_method #{payment_method}"
        end
        sleep 3 unless Rails.env.test?
        Rails.logger.info "Done Processing Payment"
        OpenStruct.new(succeeded?: true)
    end 
end
