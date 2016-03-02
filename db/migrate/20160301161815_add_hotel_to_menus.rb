class AddHotelToMenus < ActiveRecord::Migration
  def change
    add_reference :menus, :hotel, index: true, foreign_key: true
  end
end
