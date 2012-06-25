class UsersController < ApplicationController

 
  def index
	@user = User.new
  end

  def create
	@user = User.new(params[:user])
	
	if (@user.save) 
	 flash[:notice] = "User created successfully, thank you"
	
	else
	flash[:notice] = "The information you've entered is invalid"
	render 'index'
        end
  end

end
