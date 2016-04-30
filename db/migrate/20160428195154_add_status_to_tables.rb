class AddStatusToTables < ActiveRecord::Migration
  def change
    add_column :tables, :status, :number
  end
end
