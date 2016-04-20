class Order < ActiveRecord::Base
	belongs_to :hotel
	has_many :order_items
	belongs_to :order_type
	belongs_to :customer
	has_one :coupon
end
