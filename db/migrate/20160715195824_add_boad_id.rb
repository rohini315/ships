class AddBoadId < ActiveRecord::Migration
  def change
  	add_column :jobs, :boat_id, :integer
  end
end
