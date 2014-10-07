class User < ActiveRecord::Base
  
  # Relationships
  has_many :drinks
  has_many :devices
  
  # Authentication
  has_secure_password
  
  # Validations
  validates_presence_of :username
  validates :username, length: { minimum: 3 }
  validates :password, length: { minimum: 6 }
  
end
