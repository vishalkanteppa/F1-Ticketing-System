class Payment < ApplicationRecord
  belongs_to :orders

  validates_presence_of :status, :payment_method
end
