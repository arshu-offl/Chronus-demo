class RemoveLocationFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :location, :string
  end
end
