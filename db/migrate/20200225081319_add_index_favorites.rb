class AddIndexFavorites < ActiveRecord::Migration[5.2]
  def change
  	add_index :favorites, :user_id
    add_index :favorites, :post_book_id
    add_index :favorites, [:user_id, :post_book_id], unique: true
  end
end
