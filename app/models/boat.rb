class Boat < ActiveRecord::Base
	has_many :users_boats, dependent: :destroy
	has_many :users, through: :users_boats
	has_many :jobs, dependent: :destroy
	has_many :follows, dependent: :destroy
	has_many :users, through: :follows

	validates :name, :container_size, :current_loc, presence: true
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

end
