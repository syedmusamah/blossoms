class UserController < ApplicationController

  def index
	@user = User.new
  end

  def create
	@user = User.new(params[:info])
	
	if (@user.save) 
	 flash[:notice] = "User created successfully, thank you"
	
	else
	flash[:notice] = "The information you've entered is invalid"
	render 'index'
        end
  end

end
