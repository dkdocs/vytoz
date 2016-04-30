class Review < ActiveRecord::Base
	belongs_to :customer
	belongs_to :hotel

	validates :title, presence: true, length: { minimum: 5 }
end
