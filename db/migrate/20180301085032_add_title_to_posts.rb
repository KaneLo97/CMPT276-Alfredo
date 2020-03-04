class AddTitleToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :title, :string
    add_column :posts, :artist, :string
    add_column :posts, :album, :string
  end
end
