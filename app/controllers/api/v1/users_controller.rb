class Api::V1::UsersController < ApplicationController
  
  skip_before_action :verify_authenticity_token
  
  def create
    # Create a user with the specified params
    user_params = params.require(:user).permit(:username, :password, :password_confirmation)
    @user = User.new(user_params)
    
    # Save the user
    if @user.save
      # Create a device
      generate_device
      
      # Render the user info
      render '/users/show', status: :created
    else
      # Return an error if save fails
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  
  def authenticate
    @user = User.find_by_username(params[:username])
    if @user.present? && @user.authenticate(params[:password])
      generate_device
      render '/users/show', status: :ok
    else
      render json: "The username and password do not match.", status: :forbidden
    end
  end
  
  private
  
  def generate_device
    # Create a new device for the user
    @device = Device.new
    @device.user = @user
    @device.save
  end
end

