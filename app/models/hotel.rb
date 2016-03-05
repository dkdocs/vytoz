class Hotel < ActiveRecord::Base
	belongs_to :manager
	has_many :sessions, as: :login	

	def authenticate(passkey)
	self.password == passkey 
	end

	def allowed_to_login
    return true #if verified_phone
  	end
end
