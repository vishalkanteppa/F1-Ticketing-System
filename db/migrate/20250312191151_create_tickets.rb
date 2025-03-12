class CreateTickets < ActiveRecord::Migration[8.0]
  def change
    create_table :tickets do |t|
      t.string :category
      t.decimal :price, precision: 10, scale: 2
      t.integer :availability
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
