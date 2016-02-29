class Customer < ActiveRecord::Base
	has_one :session, as: :login	
end
