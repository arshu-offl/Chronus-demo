class CreateSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :sessions do |t|
      t.integer :user_id
      t.string :session_hash

      t.timestamps
    end
  end
end
