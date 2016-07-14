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
			redirect_to users_path
		else
			render "new" 
		end
	end

	def show
		@user = current_user
		@users_boats = UsersBoat.all

	end







	private 

	def user_params
		params.require(:user).permit(:name,:username,:password, :password_confirmation)
	end

end
