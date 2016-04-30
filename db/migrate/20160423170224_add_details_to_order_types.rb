class AddDetailsToOrderTypes < ActiveRecord::Migration
  def change
    add_column :order_types, :name, :string
    add_column :order_types, :description, :string
    add_column :order_types, :active, :boolean
  end
end
