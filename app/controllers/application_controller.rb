class ApplicationController < ActionController::Base
	protect_from_forgery
  	before_filter :require_user
	
	def current_user
		if @current_user.nil?
			@current_user = User.find( session[:user_id] ) if session[:user_id]
		end
  	end

	
	def require_user
			if current_user
				return true
			else
				redirect_to "/signin"
			end

	end
end