class AddEventImageUrlToEvents < ActiveRecord::Migration[8.0]
  def change
    add_column :events, :event_image_url, :string
  end
end
