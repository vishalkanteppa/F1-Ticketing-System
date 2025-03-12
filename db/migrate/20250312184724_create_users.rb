class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :role, default: "customer" # can be either customer or admin
      t.string :username

      t.timestamps
    end
  end
end
