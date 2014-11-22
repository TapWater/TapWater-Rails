require 'bcrypt'

class ApplicationController < ActionController::Base
  
  include BCrypt

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  before_filter :require_login

  def require_login
  	unless current_admin
	    redirect_to new_session_path, notice: "Please log in to view content"
  	end
  end  

  private
  	def current_admin
  	  current_admin ||= Admin.find_by_admin_hash(session[:admin_hash])
  	end


  helper_method :current_admin
end
