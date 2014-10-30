class Device < ActiveRecord::Base
  
  # Relationships
  belongs_to :user
  
  # Validations
  validates :device_token, presence: true
  validates :user_id, presence: true
  
  # Active Record Callbacks
  after_initialize :generate_device_token
  
  private
  
  def generate_device_token
    # Generate a candidate token
    candidate_token = SecureRandom.uuid
    
    # Check the uniqueness of the token and generate a new one in case of collision
    while Device.find_by_device_token(candidate_token)
      candidate_token = SecureRandom.uuid
    end
    
    # Assign the device token
    self.device_token ||= candidate_token
  end
  
end
