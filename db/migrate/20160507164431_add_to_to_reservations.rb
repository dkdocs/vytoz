class AddToToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :to, :datetime
  end
end
