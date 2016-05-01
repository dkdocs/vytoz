class Hotel < ActiveRecord::Base
	belongs_to :manager
	has_many :sessions, as: :login	
	has_many :tables
	has_many :offers
	has_one  :menu	
	has_many :orders
	has_many :hotel_charges
	has_many :order_types, :through => :hotel_charges
	
	def authenticate(passkey)
	self.password == passkey 
	end

	def allowed_to_login
    return true #if verified_phone
  	end
	
end
