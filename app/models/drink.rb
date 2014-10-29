class Drink < ActiveRecord::Base
  
  # Relationships
  belongs_to :user
  
  # Drink categories
  DRINK_CATEGORIES = {drink: 'drink', glass: 'glass', bottle: 'bottle'}
  
  # Validations
  validates :drink_date, presence: true
  validates :category, presence: true, inclusion: {in: DRINK_CATEGORIES}
  validates :user_id, presence: true
  validates :uuid, presence: true
  
end
