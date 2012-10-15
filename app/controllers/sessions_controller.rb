class SessionsController < ApplicationController

	def create
		user = User.find_by_email(params[:session][:email].downcase)
		if user
			session[:user_id] = user.id
			@current_user=user
			redirect_to restaurants_url
		else
			render "new"
		end
	end

	def new
	end

	def destroy
		session[:user_id] = nil
		redirect_to "/signin"
	end
end