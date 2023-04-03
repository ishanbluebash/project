class AddSongNameToAlbum < ActiveRecord::Migration[7.0]
  def change
    add_column :albums, :song, :text
  end
end
