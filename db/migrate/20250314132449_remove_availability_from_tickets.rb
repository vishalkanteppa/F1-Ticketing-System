class RemoveAvailabilityFromTickets < ActiveRecord::Migration[8.0]
  def change
    remove_column :tickets, :availability, :integer
  end
end
