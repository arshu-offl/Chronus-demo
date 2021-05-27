class CreateForumPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :forum_posts do |t|
      t.string :Content
      t.integer :User_id
      t.string :Hash_Tag
      t.integer :Emergency_toggle

      t.timestamps
    end
  end
end
