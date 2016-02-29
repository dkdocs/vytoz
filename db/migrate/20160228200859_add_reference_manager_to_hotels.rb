class AddReferenceManagerToHotels < ActiveRecord::Migration
  def change
    add_reference :hotels, :manager, index: true, foreign_key: true
  end
end
