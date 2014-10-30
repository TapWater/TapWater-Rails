class Api::V1::DrinksController < Api::V1::ApplicationController
  
  before_action :set_user
  
  def sync
    if @device.present? && @user.present?
      # If user exists, create and render drinks
      create_drinks
      render_drinks
    else
      # Render an error for no user
      render json: "Unable to authenticate user", status: :forbidden
    end
  end
  
  def create
    if @user.present?
      # If the user is found, create the drink
      drink_params = params.require(:drink).permit(:category, :uuid, :drink_date)
      @drink = Drink.new(drink_params)
      @drink.user = @user
      
      if @drink.save
        # Render the drink's data if it saves
        render '/drinks/show'
      else
        # Render an unprocessable entity if the save fails
        render json: @drink.errors, status: :unprocessable_entity
      end
    else
      # If no user is found render a 403
      render json: "Unable to authenticate user", status: :forbidden
    end
  end
  
  def index
    if @user.present?
      # If the user is found, render all of their drinks
      @drinks = @user.drinks
      render '/drinks/index'
    else
      render json: "Unable to authenticate user", status: :forbidden
    end
  end
  
  private
  
  def create_drinks
    # Enumerate the array of drink json
    params[:drinks].each do |raw_drink_params|
      # Load the drink params
      drink_params = raw_drink_params.require(:drink).permit(:category, :uuid, :drink_date)
      
      # Create a new drink
      drink = Drink.new(drink_params)
      drink.user = @user
      
      # Keep an array for errors creating drinks
      @errors = Array.new
      
      # If the drink doesn't exist already, create it
      if Drink.find_by_uuid(drink.uuid).nil?
        if !drink.save
          @errors = @errors.push drink.errors
        end
      end
    end
  end
  
  def render_drinks
    if @errors.empty?
      # If there are no errors load the user's drinks
      @drinks = @user.drinks
    
      # Render the drinks
      render '/drinks/index', status: :created
    else
      # Render an unprocessable entity if there are errors
      render json: @errors, status: :unprocessable_entity
    end
  end
  
  def set_user
    # Fetch the user with the device token
    @device = Device.find_by_device_token(params[:device_token])
    @user = @device.user if @device
  end
  
end