class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :address
      t.string :phone
      t.boolean :active

      t.timestamps null: false
    end
  end
end
