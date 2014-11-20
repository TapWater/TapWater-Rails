class Admin < ActiveRecord::Base
	has_secure_password

	validates :password, length: { minimum: 6 }, confirmation: true
	validates :name, length: { minimum: 3 }, presence: true
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }, presence: true, uniqueness: true
end
