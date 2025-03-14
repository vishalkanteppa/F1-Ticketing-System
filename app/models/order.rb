class Order < ApplicationRecord
  has_many :payments
  has_many :tickets
  belongs_to :user

  validates_presence_of :status, :total_price
end
