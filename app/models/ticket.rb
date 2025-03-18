class Ticket < ApplicationRecord
  has_many :line_items, dependent: :destroy
  belongs_to :event

  validates_presence_of :category, :price
end
