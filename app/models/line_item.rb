class LineItem < ApplicationRecord
  belongs_to :ticket
  belongs_to :order
  belongs_to :cart
end
