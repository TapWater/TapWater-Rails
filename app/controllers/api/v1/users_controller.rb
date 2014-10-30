class Api::V1::UsersController < Api::V1::ApplicationController
  
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
    # Find the user
    @user = User.find_by_username(params[:username])
    
    if @user.present? && @user.authenticate(params[:password])
      # If the user authenticates render a device token
      generate_device
      render '/users/show', status: :ok
    else
      # If the user fails to authenticate render a 403
      render json: "The username and password do not match.", status: :forbidden
    end
  end
  
  def me
    # Find the device and load its user
    @device = Device.find_by_device_token(params[:device_token])
    @user = @device.user if @device
    
    if @user
      # If the credentials are good render the user
      render '/users/show', status: :ok
    else
      # If the credentials are bad render a 403
      render json: "The user could not be found.", status: :forbidden
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

