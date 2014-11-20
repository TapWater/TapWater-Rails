class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :require_login

  def require_login
  	unless current_admin
	  redirect_to "/sessions/new", notice: "Please log in to view content"
  	end
  end

  private
  	def current_admin
  	  @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  	end

  helper_method :current_admin
end
