class AddUniqueIndexToUpvotes < ActiveRecord::Migration[6.1]
  def change
    add_index :upvotes, [:user_id, :post_id], unique: true
  end
end
