class SessionsController < ApplicationController

  skip_before_action :require_login

  def new
  end

  def create
	  admin = Admin.find_by_email(params[:email])
	  if admin && admin.authenticate(params[:password])
	    session[:admin_hash] = admin.admin_hash
	    redirect_to root_url, notice: "Logged in!"
	  else
	    flash.now[:alert] = "Invalid email or password"
	    render "new"
	  end
  end

  def destroy
    session[:admin_hash] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
