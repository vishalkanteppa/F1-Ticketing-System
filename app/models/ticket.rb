class Ticket < ApplicationRecord
  belongs_to :event
  belongs_to :order, optional: true

  validates_presence_of :category, :price
end
