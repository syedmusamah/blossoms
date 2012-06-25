class SessionsController < ApplicationController
  def new
  end
 
  def create
	user = User.authenticate(params[:session][:email], params[:session][:password])
		if user.nil?
			flash.now[:error] = "invalid email/password combination"
 			render 'new'
		else
		   session[:remember_token] = user.id
 		   flash[:notice] = "Welcome to the inventory #{user.name}!"
		   redirect_to :controller => 'products',:action => 'index'
		end
  
  end

  def destroy
	session[:remember_token] = nil
	flash[:notice] = "Good bye, #{user.name}!"
        redirect_to 'new'
  end

end
