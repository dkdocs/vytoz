class Manager < ActiveRecord::Base
	has_many :hotels
	has_one :session, as: :login	
end
