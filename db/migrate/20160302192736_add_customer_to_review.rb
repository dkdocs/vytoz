class AddCustomerToReview < ActiveRecord::Migration
  def change
    add_reference :reviews, :customer, index: true, foreign_key: true
  end
end
