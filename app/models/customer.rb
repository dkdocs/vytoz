class Customer < ActiveRecord::Base
	has_one :session, as: :login
	has_many :orders
	has_one :wallet	
	has_many :reservations
	has_many :tables, through: :reservations
end
