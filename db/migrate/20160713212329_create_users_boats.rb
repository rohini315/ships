class CreateUsersBoats < ActiveRecord::Migration
  def change
    create_table :users_boats do |t|
      t.integer :user_id
      t.integer :boat_id

      t.timestamps null: false
    end
  end
end
