class AddDetailsToOrderItem < ActiveRecord::Migration
  def change
  	add_reference :order_items, :menu_item, :index => true
  end
end
