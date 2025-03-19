class LineItem < ApplicationRecord
  belongs_to :ticket
  belongs_to :order, optional: true
  belongs_to :cart
end
