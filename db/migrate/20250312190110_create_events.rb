class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.datetime :date
      t.string :status, default: "upcoming" # can be 'upcoming' or 'completed'

      t.timestamps
    end
  end
end
