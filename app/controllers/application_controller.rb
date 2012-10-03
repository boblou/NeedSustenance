class ApplicationController < ActionController::Base
	protect_from_forgery
	before_filter :require_user
	skip_before_filter :require_user, :only => [:new, :create]
	
	def current_user
		if @current_user.nil?
			@current_user = User.find( session[:user_id] ) if session[:user_id]
		end
    # @_current_user ||= session[:current_user_id] &&
    #   User.find_by_id(session[:current_user_id])
  	end
  	helper_method :current_user
	
	def require_user
			if current_user
				return true
			else
				redirect_to root_url
			end

		# if current_user.nil?
		# 	flash[:error] = "You must be logged in to access this section"
		# end
	end
end