class AddMenuToMenuItem < ActiveRecord::Migration
  def change
    add_reference :menu_items, :menu, index: true, foreign_key: true
  end
end
