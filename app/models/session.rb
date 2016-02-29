class Session < ActiveRecord::Base
	belongs_to :login, polymorphic: :true
end
