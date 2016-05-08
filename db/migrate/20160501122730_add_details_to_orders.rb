class AddDetailsToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :gross_total, :decimal, :precision => 10, :scale => 2
  	add_column :orders, :net_total, :decimal, :precision => 10, :scale => 2
  	add_column :orders, :discount, :decimal, :precision => 10, :scale => 2
  	add_column :orders, :tax, :decimal, :precision => 10, :scale => 2
  	add_column :orders, :total_payable, :decimal, :precision => 10, :scale => 2
  	add_column :orders, :cashback_amount, :decimal, :precision => 10, :scale => 2
  	add_column :orders, :remark, :string
  end
end
