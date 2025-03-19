class AddPaymentTypeToOrders < ActiveRecord::Migration[8.0]
  def change
    add_column :orders, :payment_type, :integer
  end
end
