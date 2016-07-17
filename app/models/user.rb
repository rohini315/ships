class User < ActiveRecord::Base
	has_secure_password
	has_many :users_boats, dependent: :destroy
	has_many :boats, through: :users_boats

end
