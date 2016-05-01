class Customer < ActiveRecord::Base
	has_many :sessions, as: :login	
	has_many :orders
	has_one :wallet	
	has_many :reservations
	has_many :tables, through: :reservations
	
	def authenticate(passkey)
		self.password == passkey 
	end

	def allowed_to_login
    	return true #if verified_phone
	end

	def cart
    	Cartman::Cart.new(id)
  	end

end
