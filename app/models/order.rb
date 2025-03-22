class Order < ApplicationRecord
  has_many :payments, dependent: :destroy
  has_many :line_items, dependent: :destroy
  belongs_to :user

  validates_presence_of :status, :total_price

  enum :payment_type, {
    "Credit card": 0,
    "Paypal": 1,
    "SEPA": 2
  }

  validates :payment_type, inclusion: { in: Order.payment_types.keys }

  def add_line_items_from_cart(cart)
    cart.line_items.each do |line_item|
      line_item.update(cart_id: nil, order_id: self.id)
    end
  end

  def process_payment(payment_type:, payment_details:)
    if payment_type == "Credit card"
      payment_details = {
          credit_card_number: payment_details[:credit_card_number],
          expiration_date: payment_details[:expiration_date],
          cvv: payment_details[:cvv]
          }
    elsif payment_type == "Paypal"
        payment_details = {
            credit_card_number: payment_details[:wallet_no],
            }
    elsif payment_type == "SEPA"
        payment_details = {
            iban: payment_details[:iban],
            bic: payment_details[:bic],
            }
    end
    payment_result = Fakepay.make_payment(
      order_id: self.id,
      payment_type: payment_type,
      payment_details: payment_details
    )

    if payment_result.succeeded?
      self.update(status: "paid")
      Rails.logger.info "Payment processed successfully for order ##{self.id}"
    else
      self.update(status: "payment_failed")
      Rails.logger.error "Payment failed for order ##{self.id}"
    end
  end

end