class ChangeSongDataTypeInAlbums < ActiveRecord::Migration[7.0]
  def change
    change_column :albums, :song, :string
  end
end
