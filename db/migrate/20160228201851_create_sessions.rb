class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :session_id
      t.boolean :logout

      t.timestamps null: false
    end
  end
end
