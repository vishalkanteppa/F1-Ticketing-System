class LineItem < ApplicationRecord
  belongs_to :ticket
  belongs_to :order, optional: true
  belongs_to :cart

  def increment_quantity
    self.quantity += 1
    self.total_price = self.quantity * self.ticket.price
  end
  def decrement_quantity
    self.quantity -= 1
    self.total_price = self.quantity * self.ticket.price
  end
end
