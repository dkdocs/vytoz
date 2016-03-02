class Hotel < ActiveRecord::Base
	belongs_to :manager
	has_one :session, as: :login
	has_many :tables
	has_many :offers
	has_one  :menu	
	has_many :orders
	has_many :hotel_charges
	has_many :order_types, :through => :hotel_charges
end
