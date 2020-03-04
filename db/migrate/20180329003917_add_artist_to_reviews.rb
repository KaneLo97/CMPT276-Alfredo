class AddArtistToReviews < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :artist, foreign_key: true
  end
end
