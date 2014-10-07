class Drink < ActiveRecord::Base
  
  # Relationships
  belongs_to :user
  
  # Drink categories
  DRINK_CATEGORIES = {drink: 'drink', glass: 'glass', bottle: 'bottle'}
  
  # Validations
  validates_presence_of :category, :user_id, :uuid, :drink_date
  validates :category, inclusion: {in: DRINK_CATEGORIES}
  
end
