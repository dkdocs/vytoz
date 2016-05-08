class OrderSerializer < ActiveModel::Serializer
  attributes :id, :customer,:customer_address,:payment_method, :discount,:hotel,:net_total,:order_type,:extra_charges,
  :currency_redeem,:total_payable,:tax, :round_off,:total_payable,:cashback_amount,:couponable,:remark
  # :gross_total, :net_total, :total_payable, :items,
  #             :currency_redeem, :discount, :placed_at, :cashback_amount, :round_off, :no_of_items, :tracking_id,
  #             :allowed_to_repeat, :remark, :transaction_id, :dg_message,
  #             :discount_applied, :discount_code,:total_payable_without_discount, :allowed_cashback, :outlet_service_charges, :status
  has_many :order_items
  belongs_to :order_type
  belongs_to :customer
  has_one :coupon
end




