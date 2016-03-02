class AddTableToReservation < ActiveRecord::Migration
  def change
    add_reference :reservations, :table, index: true, foreign_key: true
  end
end
