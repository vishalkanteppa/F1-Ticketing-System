class Ticket < ApplicationRecord
  belongs_to :event

  validates_presence_of :category, :price, :availability
end
