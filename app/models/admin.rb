require 'bcrypt'

class Admin < ActiveRecord::Base
	has_secure_password

	attr_accessor :hash
	include BCrypt

	validates :password, length: { minimum: 6 }, confirmation: true
	validates :name, length: { minimum: 3 }, presence: true
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }, presence: true, uniqueness: true

	def admin_hash
		salt = BCrypt::Engine.generate_salt
     	self.hash = BCrypt::Engine.hash_secret(self.id, salt)
    end

    def self.find_by_admin_hash(hash)
    	Admin.all.each do |admin|
    		if admin.hash == hash
    			return admin
    		end
    	end
    	return nil
    end

end
