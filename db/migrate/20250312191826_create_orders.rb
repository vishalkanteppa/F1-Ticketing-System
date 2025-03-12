class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :status, default: "pending" # can be 'pending' 'completed' or 'cancelled'
      t.decimal :total_price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
