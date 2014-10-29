class User < ActiveRecord::Base
  
  # Relationships
  has_many :drinks
  has_many :devices
  
  # Authentication
  has_secure_password
  
  # Validations
  validates :username, length: { minimum: 3 }, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, presence: true
  
end
