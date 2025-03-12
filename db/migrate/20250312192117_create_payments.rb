class CreatePayments < ActiveRecord::Migration[8.0]
  def change
    create_table :payments do |t|
      t.references :order, null: false, foreign_key: true
      t.string :status, default: "pending"
      t.string :payment_method

      t.timestamps
    end
  end
end
