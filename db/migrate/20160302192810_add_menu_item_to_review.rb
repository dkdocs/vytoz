class AddMenuItemToReview < ActiveRecord::Migration
  def change
    add_reference :reviews, :menu_item, index: true, foreign_key: true
  end
end
