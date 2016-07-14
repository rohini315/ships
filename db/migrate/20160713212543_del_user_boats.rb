class DelUserBoats < ActiveRecord::Migration
  def change
  	drop_table :user_boats
  end
end
