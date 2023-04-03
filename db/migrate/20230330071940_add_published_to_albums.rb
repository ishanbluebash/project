class AddPublishedToAlbums < ActiveRecord::Migration[7.0]
  def change
    add_column :albums, :published, :boolean, default: true
  end
end
