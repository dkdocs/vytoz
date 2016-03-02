class AddWalletToCustomer < ActiveRecord::Migration
  def change
    add_reference :customers, :wallet, index: true, foreign_key: true
  end
end
