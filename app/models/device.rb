class Device < ActiveRecord::Base
  
  # Relationships
  belongs_to :user
  
  # Validations
  validates_presence_of :user_id, :device_token
  
end
