class AddLoginToSessions < ActiveRecord::Migration
  def change
    add_reference :sessions, :login, polymorphic: true, index: true
  end
end
