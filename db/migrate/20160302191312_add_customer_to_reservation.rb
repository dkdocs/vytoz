class AddCustomerToReservation < ActiveRecord::Migration
  def change
    add_reference :reservations, :customer, index: true, foreign_key: true
  end
end
