class Order < ApplicationRecord
  has_many :payments
  belongs_to :user

  validates_presence_of :status, :total_price
end
