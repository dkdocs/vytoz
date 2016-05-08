class AddFromToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :from, :datetime
  end
end
