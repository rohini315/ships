class User < ActiveRecord::Base
	has_secure_password
	has_many :users_boats, dependent: :destroy
	has_many :boats, through: :users_boats
	has_many :follows, dependent: :destroy
	has_many :boats, through: :follows

	validates :name, :username, :password_digest, presence: true
	validates :username, uniqueness: { message: "Nope, it is already taken."}

	# scope for only that user
end
