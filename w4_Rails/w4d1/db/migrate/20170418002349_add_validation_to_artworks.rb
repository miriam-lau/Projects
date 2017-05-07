class AddValidationToArtworks < ActiveRecord::Migration[5.0]
  def change
    add_index :artworks, [:artist_id, :title], unique: true
  end
end
