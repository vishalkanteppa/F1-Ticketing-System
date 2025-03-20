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
    cart.line_items.update_all(cart_id: nil, order_id: self.id)
  end

end