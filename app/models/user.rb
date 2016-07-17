class User < ActiveRecord::Base
	has_secure_password
	has_many :users_boats, dependent: :destroy
	has_many :boats, through: :users_boats

	validates :name, :username, :password_digest, presence: true
	validates :username, uniqueness: { message: "Nope, it is already taken."}
end
