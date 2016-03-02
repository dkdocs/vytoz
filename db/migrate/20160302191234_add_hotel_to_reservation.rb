class AddHotelToReservation < ActiveRecord::Migration
  def change
    add_reference :reservations, :hotel, index: true, foreign_key: true
  end
end
