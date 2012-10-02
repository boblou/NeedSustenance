class SessionsController < ApplicationController

	def create
		user = User.find_by_email(params[:session][:email].downcase)
		if user
			session[:user_id] = user.id
			redirect_to restaurants_url
		else
			render "new"
		end
	end

	def new
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "You have successfully logged out"
		redirect_to root_url
	end
end