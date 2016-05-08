class AddStatusToTables < ActiveRecord::Migration
  def change
    add_column :tables, :status, :boolean, default: false
  end
end
