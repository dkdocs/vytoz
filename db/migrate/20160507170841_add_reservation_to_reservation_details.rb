class AddReservationToReservationDetails < ActiveRecord::Migration
  def change
    add_reference :reservation_details, :reservation, index: true, foreign_key: true
  end
end
