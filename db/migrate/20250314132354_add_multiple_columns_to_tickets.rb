class AddMultipleColumnsToTickets < ActiveRecord::Migration[8.0]
  def change
    add_column :tickets, :seat_no, :string
    add_column :tickets, :status, :string, default: "available"
    add_reference :tickets, :order, foreign_key: true
  end
end
