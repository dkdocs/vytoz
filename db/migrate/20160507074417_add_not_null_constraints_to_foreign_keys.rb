class AddNotNullConstraintsToForeignKeys < ActiveRecord::Migration
  def change
  	change_column_null :hotels, :manager_id, false
  	change_column_null :tables, :hotel_id, false
  	change_column_null :offers, :hotel_id, false
  	change_column_null :menus, :hotel_id, false
  	change_column_null :orders, :hotel_id, false
  	change_column_null :hotel_charges, :hotel_id, false
  	change_column_null :hotel_charges, :order_type_id, false
  	change_column_null :order_items, :order_id, false
  	change_column_null :orders, :order_type_id, false
  	change_column_null :orders, :customer_id, false
  	change_column_null :orders, :coupon_id, false
  	change_column_null :customers, :wallet_id, false
  	change_column_null :reservations, :hotel_id, false
  	change_column_null :reservations, :customer_id, false
  	change_column_null :menu_items, :menu_id, false
  	change_column_null :reviews, :customer_id, false
  	change_column_null :hotel_taxes, :tax_type_id, false
  	change_column_null :hotel_taxes, :hotel_id, false
  	change_column_null :reviews, :hotel_id, false
  end
end