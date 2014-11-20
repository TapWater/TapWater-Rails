require 'bcrypt'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include BCrypt

  before_filter :get_id
  before_filter :require_login

  def require_login
  	unless current_admin
	  redirect_to "/sessions/new", notice: "Please log in to view content"
  	end
  end  

  private

    def admin_hash
      admin ||= Admin.find(@id) if @id
      salt = BCrypt::Engine.generate_salt
      hash = BCrypt::Engine.hash_secret(admin, salt)
    end

  	def current_admin
  	  current_admin ||= admin_hash
  	end

    def get_id
      @id = session[:admin_id]
    end

  helper_method :get_id
end
