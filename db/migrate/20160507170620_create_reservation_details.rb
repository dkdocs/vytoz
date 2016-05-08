class CreateReservationDetails < ActiveRecord::Migration
  def change
    create_table :reservation_details do |t|

      t.timestamps null: false
    end
  end
end
