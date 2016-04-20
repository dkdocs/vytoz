class Menu < ActiveRecord::Base
	belongs_to :hotel
	has_many :menu_items
end
