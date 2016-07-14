class BoatsController < ApplicationController


	def new
		@locs=[[ "New York",0 ],["San Juan", 1],["Rio de Janeiro",2] ,["Zeebrugge", 3],["Shanghai",4], ["Calcutta",5],["Pusan",6],["Yokohama",7],["Derby",8],["Cape Town",9],["St. Petersburg",10]]
		@boat=Boat.new
	end

	def create
		@boat = Boat.create(boat_params)
		if @boat.save
			@user_boat = UsersBoat.create(boat_id: @boat.id, user_id: current_user.id)
		end
	end

	def update
	end

	def show
	end

	def destroy
	end


	private
	def boat_params
		params.require(:boat).permit(:name,:container_size,:current_loc)
	end
end
