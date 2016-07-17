class Boat < ActiveRecord::Base
	has_many :users_boats, dependent: :destroy
	has_many :users, through: :users_boats
	has_many :jobs, dependent: :destroy


	
end
