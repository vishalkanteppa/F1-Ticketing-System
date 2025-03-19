class Order < ApplicationRecord
  has_many :payments, dependent: :destroy
  has_many :line_items, dependent: :destroy
  belongs_to :user

  validates_presence_of :status, :total_price

  enum :payment_type, {
    "Credit card" => 0,
    "Debit card" => 1,
    "Paypal" => 2
  }
end
