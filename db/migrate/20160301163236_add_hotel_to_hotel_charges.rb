class AddHotelToHotelCharges < ActiveRecord::Migration
  def change
    add_reference :hotel_charges, :hotel, index: true, foreign_key: true
  end
end
