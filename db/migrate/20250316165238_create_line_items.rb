class CreateLineItems < ActiveRecord::Migration[8.0]
  def change
    create_table :line_items do |t|
      t.references :ticket, null: false, foreign_key: true
      t.references :order, null: true, foreign_key: true
      t.references :cart, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :total_price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
