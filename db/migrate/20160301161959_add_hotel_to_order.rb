class AddHotelToOrder < ActiveRecord::Migration
  def change
    add_reference :orders, :hotel, index: true, foreign_key: true
  end
end
