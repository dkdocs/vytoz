class Order < ActiveRecord::Base
	belongs_to :hotel
	has_many :order_items
	belongs_to :order_type
	belongs_to :customer
	has_one :coupon

  after_commit :create_order_items, on: :create

	def calculate_final_pricing(customer, requirements)
    self.customer = customer
    self.customer_address_id = requirements[:address]
    self.payment_method = requirements[:payment_method]
    self.discount = find_coupon_discount(customer.cart)
    self.hotel = find_hotel(customer.cart)
    self.net_total = self.customer.cart.total
    self.order_type = find_order_type(requirements[:order_type])
    extra_charges = add_extra_charges(requirements[:order_type])
    if requirements[:currency_redeem] == "true" && requirements[:redeem_amount] && requirements[:redeem_amount] > 0
      self.currency_redeem = requirements[:redeem_amount]
      #self.net_total -= requirements[:redeem_amount]
      self.total_payable -= requirements[:redeem_amount]
    end
    self.tax = all_taxes.inject(0) {|sum, i| sum + i[:amount]}
    self.round_off = total_round_off
    self.total_payable = self.total_payable.round
    self.cashback_amount = find_cashback_amount
    self.couponable = find_applied_coupon
    self.remark = requirements[:remark]
    return self, service_charges
  end

  def find_coupon_discount(cart)
  	0
  end


  def create_order_items
    current_user.cart.items.each do |item|
      self.order_items.create(menu_item_id: item.id, quantity: item.quantity)
    end
  end



  def all_taxes
  	{}
  end

  def find_cashback_method
  end

  def find_applied_coupon
  end
  
end
