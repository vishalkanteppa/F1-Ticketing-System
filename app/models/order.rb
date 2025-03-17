class Order < ApplicationRecord
  has_many :payments, dependent: :destroy
  has_many :line_items
  belongs_to :user

  validates_presence_of :status, :total_price
end
