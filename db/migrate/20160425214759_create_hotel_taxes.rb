class CreateHotelTaxes < ActiveRecord::Migration
  def change
    create_table :hotel_taxes do |t|
      t.references :hotel, index: true, foreign_key: true
      t.references :tax_type, index: true, foreign_key: true
      t.decimal :amount
      t.decimal :percent
      t.boolean :active

      t.timestamps null: false
    end
  end
end
