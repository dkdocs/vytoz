class AddHotelToOffers < ActiveRecord::Migration
  def change
    add_reference :offers, :hotel, index: true, foreign_key: true
  end
end
