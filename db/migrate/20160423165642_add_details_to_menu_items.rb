class AddDetailsToMenuItems < ActiveRecord::Migration
  def change
    add_column :menu_items, :name, :string
    add_column :menu_items, :description, :string
    add_column :menu_items, :price, :decimal
    add_column :menu_items, :code, :string
    add_column :menu_items, :active, :boolean
  end
end
