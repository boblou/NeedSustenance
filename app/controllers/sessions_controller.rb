class SessionsController < ApplicationController
#add exception	
	def create
		user = User.find_by_email(params[:session][:email].downcase)
		session[:current_user_id] = user.id
		render 'new'
	end

	def new	
	end

	def destroy
		@_current_user = session[:current_user_id] = nil
		flash[:notice] = "You have successfully logged out"
		redirect_to root_url
	end
end