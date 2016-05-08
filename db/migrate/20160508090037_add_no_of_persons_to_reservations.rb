class AddNoOfPersonsToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :no_of_persons, :integer
  end
end
