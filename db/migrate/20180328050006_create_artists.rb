class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.integer :spotify_id

      t.timestamps
    end
  end
end
