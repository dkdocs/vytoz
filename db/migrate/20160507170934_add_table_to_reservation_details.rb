class AddTableToReservationDetails < ActiveRecord::Migration
  def change
    add_reference :reservation_details, :table, index: true, foreign_key: true
  end
end
