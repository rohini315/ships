class FollowsController < ApplicationController
	def create
		@follow = Follow.new
		@follow = Follow.create(user_id: current_user.id, boat_id: params[:boat_id])
		@boat_id = params[:boat_id]

		respond_to do |format|
			format.js 
			format.html 
		end
	end

	def destroy
		
	end

	def index
		@follows = Follow.all
	end
end
