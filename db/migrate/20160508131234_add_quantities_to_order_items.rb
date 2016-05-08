class AddQuantitiesToOrderItems < ActiveRecord::Migration
  def change
  	add_column :order_items, :quantity, :decimal, :precision => 4, :scale => 0
  end
end
