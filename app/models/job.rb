class Job < ActiveRecord::Base
	belongs_to :boat
	validates :name, :container, :cargo, :origin,:cost,:dest, presence: true
	validates :name, uniqueness: { message: "You already have same job."}
	validates :cargo, length: { minimum: 50, message: "minimum 50 characteres" }
	validates :cost,  numericality: {greater_than: 1000, message: "minimum cost is $1000" }
end
