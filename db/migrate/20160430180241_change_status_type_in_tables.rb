class ChangeStatusTypeInTables < ActiveRecord::Migration
  def change
  	change_column :tables, :status, :boolean, default: false
  end
end
