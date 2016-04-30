class AddDetailsToMenu < ActiveRecord::Migration
  def change
  	add_column :menus, :name, :string
  	add_column :menus, :active, :boolean
  end
end
