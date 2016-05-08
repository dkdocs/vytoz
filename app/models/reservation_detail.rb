class ReservationDetail < ActiveRecord::Base
	belongs_to :reservation 
	belongs_to :table
end
