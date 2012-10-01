class ApplicationController < ActionController::Base
	protect_from_forgery
	before_filter :require_user
	skip_before_filter :require_user, :only => [:new, :create]

	def current_user
    @_current_user ||= session[:current_user_id] &&
      User.find_by_id(session[:current_user_id])
  	end
	
	def require_user
		if current_user.nil?
			flash[:error] = "You must be logged in to access this section"
		end
	end
end