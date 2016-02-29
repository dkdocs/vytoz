class Hotel < ActiveRecord::Base
	belongs_to :manager
	has_one :session, as: :login	
end
