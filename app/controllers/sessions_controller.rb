class SessionsController < ApplicationController

  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		log_in user
  		flash[:success] = "Welcome back to the Sample App!"
  		redirect_to user
  	else
  		flash.now[:danger] = "Invalid email/password combination"
  		render :new
  	end
  end

  def destroy
  		logout_user
  		flash[:success] = "You are logout"
  		redirect_to root_url
  end
end
