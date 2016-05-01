class Reservation < ActiveRecord::Base
	enum status: [:booked, :hotel_cancelled, :user_cancelled]

	belongs_to :hotel
	belongs_to :table
	belongs_to :customer
end
