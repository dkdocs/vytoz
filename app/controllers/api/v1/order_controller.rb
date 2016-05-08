class Api::V1::OrderController < Api::V1::ApiController
before_filter :authenticate

 swagger_controller :order, 'Order'
  swagger_api :validate do
    summary 'validate'
    param :header, 'Session-Id', :string, :required, 'Session id'
    param :query, 'payment_method', :string, :required, 'Payment Method'
    param :query, 'currencyRedeem', :boolean, :optional, 'Currency Redeem'
    param :query, 'address_id', :string, :optional, 'address id'
    param :query, 'remark', :string, :optional, 'Remark'
    param :query, 'order_type', :optional, 'Optional Order Type'
    response :method_not_allowed
    response :unprocessable_entity
  end

    def validate
    if current_user.cart.count >= 1
      new_order, service = Order.new.calculate_final_pricing(current_user, bill_requirements)
      if new_order.valid?
        render json: meta: meta_response(200, 'All OK.')
      else
        render json: {meta: meta_response(405, new_order.errors.full_messages.join(','))}
      end
    else
      render json: {meta: meta_response(405, "First add some product in cart")}
    end
  end


  swagger_api :checkout do
    summary 'checkout'
     param :header, 'Session-Id', :string, :required, 'Session id'
    param :query, 'payment_method', :string, :required, 'Payment Method'
    param :query, 'currencyRedeem', :boolean, :optional, 'Currency Redeem'
    param :query, 'address_id', :string, :optional, 'address id'
    param :query, 'remark', :string, :optional, 'Remark'
    param :query, 'order_type', :optional, 'Optional Order Type'
    response :method_not_allowed
    response :unprocessable_entity
  end

  def checkout
    if current_user.cart.count >= 1
      new_order, service = Order.new.calculate_final_pricing(current_user, bill_requirements)
      if new_order.valid?
        new_order.save
        render json: new_order, meta: meta_response(200, 'Every thing is fine'), serializer: OrderSerializer
      else
        render json: {meta: meta_response(405, new_order.errors.full_messages.join(','))}
      end
    else
      render json: {meta: meta_response(405, "First add some product in cart")}
    end
  end

end
