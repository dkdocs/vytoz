class AddOrderTypeToHotelCharges < ActiveRecord::Migration
  def change
    add_reference :hotel_charges, :order_type, index: true, foreign_key: true
  end
end
