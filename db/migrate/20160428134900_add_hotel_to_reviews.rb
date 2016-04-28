class AddHotelToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :hotel, index: true, foreign_key: true
  end
end
