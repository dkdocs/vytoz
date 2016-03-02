class CreateHotelCharges < ActiveRecord::Migration
  def change
    create_table :hotel_charges do |t|

      t.timestamps null: false
    end
  end
end
