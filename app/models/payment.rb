class Payment < ApplicationRecord
  belongs_to :order

  validates_presence_of :status, :payment_method
end
