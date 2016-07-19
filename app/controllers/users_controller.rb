class UsersController < ApplicationController

	def index
		@users=User.all
	end

	def new
		@user=User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id]=@user.id
			redirect_to users_path(@user)
		else
			render "new" 
		end
	end

	def show
		@all_boats = Boat.all			
		@all_users_boats = UsersBoat.all
		@user = current_user
		# @users_boats = UsersBoat.where(user_id: @user.id)
		@locs = locs


		


	end

	def edit
     @user = User.find(params[:id])
     # redirect_to '/users/#{@user.id}'
	end

	def update
	@user = User.find(params[:id])
	@user.update(user_params)
	# redirect_to :back
	redirect_to user_path(@user.id)
	# redirect_to '/users/#{@user.id}'
	end

	# def follow
	# 	@follow = Follow.create(boat_id: @boat.id, user_id: current_user.id)
	# end


	private 

	def user_params
		params.require(:user).permit(:name,:username,:password, :password_confirmation)
	end

end
