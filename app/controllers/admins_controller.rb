class AdminsController < ApplicationController
  # GET /admins/new
  def new
    @admin = Admin.new
  end

  # POST /admins
  # POST /admins.json
  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to root_url, :notice => "Signed in"
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
