class SessionsController < ApplicationController
		
	def new
	end

	def create
		@user=User.find_by_username(params[:username])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect_to user_path(@user)
			flash[:notice] = "You are logged in"
		else
			redirect_to :back
			flash[:error] = "Not logged in"
		end
	end

	def destroy
		session[:user_id]=nil
		redirect_to "/"
	end


end
