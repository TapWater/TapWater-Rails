class Api::V1::ApplicationController < ApplicationController
  
  skip_before_action :verify_authenticity_token
  skip_before_action :require_login
  
end