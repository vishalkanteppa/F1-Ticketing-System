class RemoveMutlipleColumnsFromTickets < ActiveRecord::Migration[8.0]
  def change
    remove_column :tickets, :seat_no
    remove_column :tickets, :status
    remove_column :tickets, :order_id
  end
end
