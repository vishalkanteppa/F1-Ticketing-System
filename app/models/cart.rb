class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  belongs_to :user

  def total_price
    line_items.sum(&:total_price)
  end

  def quantity_of_ticket(ticket)
    line_items.find_by(ticket_id: ticket.id)&.quantity || 0
  end
end
