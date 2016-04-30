class HotelTax < ActiveRecord::Base
  belongs_to :hotel
  belongs_to :tax_type
end
