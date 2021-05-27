class DeleteEmergencyColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :forum_posts, :Emergency_toggle, :integer
  end
end
