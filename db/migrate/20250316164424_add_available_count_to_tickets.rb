class AddAvailableCountToTickets < ActiveRecord::Migration[8.0]
  def change
    add_column :tickets, :available_count, :integer
  end
end
