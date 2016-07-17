class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def locs
    locs=[[ "New York",0 ],["San Juan", 1],["Rio de Janeiro",2] ,["Zeebrugge", 3],["Shanghai",4], ["Calcutta",5],["Pusan",6],["Yokohama",7],["Derby",8],["Cape Town",9],["St. Petersburg",10]]
  end

  def current_user
  	if session[:user_id]
  		
  		flash[:notice] = "current_user saved"
  		@current_user = User.find(session[:user_id])
  	else
  		
  		flash[:notice] = "current_user NIL"
  		session[:user_id] = nil
  	end
  end



   helper_method :current_user
   helper_method :locs
end



