class HotelCharge < ActiveRecord::Base
	belongs_to :hotel
	belongs_to :order_type
end
