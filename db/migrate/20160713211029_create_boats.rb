class CreateBoats < ActiveRecord::Migration
  def change
    create_table :boats do |t|
      t.string :name
      t.integer :container_size
      t.string :current_loc

      t.timestamps null: false
    end
  end
end
