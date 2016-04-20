class AddHotelToTables < ActiveRecord::Migration
  def change
    add_reference :tables, :hotel, index: true, foreign_key: true
  end
end
