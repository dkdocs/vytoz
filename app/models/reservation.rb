class Reservation < ActiveRecord::Base
	belongs_to :hotel
	belongs_to :table
	belongs_to :customer
end
