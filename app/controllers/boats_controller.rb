class BoatsController < ApplicationController

 
	def new
		@locs = locs
		@boat=Boat.new
	end

	def create
		@boat = Boat.create(boat_params)
		if @boat.save
			@user_boat = UsersBoat.create(boat_id: @boat.id, user_id: current_user.id)
			redirect_to users_path(current_user.id)
		else
			redirect_to new_boat_path
		end
	end


	def edit
		@locs = locs
		@boat = Boat.find(params[:id])

	end

	def update
		@locs = locs
		@boat = Boat.find(params[:id])
		@boat.update(boat_params)

		redirect_to boat_path(@boat)
	end

	def show
		@boat = Boat.find(params[:id])
		@jobs = Job.where(boat_id: @boat.id)
		# Job.where(boat_id: @boat_id)
	end

	def destroy
		@boat = Boat.find(params[:id])
	    @boat.destroy
	    redirect_to :back
	end


	private
	def boat_params
		params.require(:boat).permit(:name,:container_size,:current_loc, :avatar)
	end

end
