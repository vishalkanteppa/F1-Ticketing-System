class RemoveUsernameFromUsers < ActiveRecord::Migration[8.0]
  def change
    remove_column :users, :username, :string
  end
end
