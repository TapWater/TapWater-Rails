class AdminsController < ApplicationController
  before_filter :require_login
  
  # GET /admins/new
  def new
    @admin = Admin.new
  end

  # POST /admins
  # POST /admins.json
  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to root_url, :notice => "Registered admin!"
    else
      render "new"
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
      params.require(:admin).permit(:name, :email, :password, :password_confirmation)
    end
end
