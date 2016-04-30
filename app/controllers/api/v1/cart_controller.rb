class Api::V1::CartController < Api::V1::ApiController
before_filter :authenticate

swagger_controller :cart, 'MenuItems'

  swagger_api :create do
    summary 'Create Cart'
    param :header, 'Session-Id', :string, :required, 'Session id'
    param :form, :cart_items, :json, :required, "Cart Items"
    param :form, :order_type, :string, :optional, "Order Type"
    response :not_acceptable
    response :not_found
    response :not_allowed
  end


  def create
  	error, items = parse_json(params["cart_items"])
    return render json: {meta: meta_response(406, "Invalid JSON object passed.")} if error == true
    cart_session = set_cart_session
  	unavailable_items = []
  	items.each do |item| 
  		error, menu_item = validate_product_and_customizations item
  		if error == true
  			unavailable_items << menu_item
  		else
  			current_user.cart.add_item(id: menu_item.id, name: menu_item.name, unit_cost: menu_item.cost, cost: menu_item.cost * params[:quantity], quantity: params[:quantity], remark: params[:remark])		
  		end
  	end
  	if unavailable_items.length == 0 
  		render json: current_user.cart, order_type: params[:order_type], cart_session: redis.get(cart_session), meta: meta_response(200, 'All OK')
  	else
  		render json: meta: meta_response(200, 'All OK')
  	end
  end


  def index 
	cart_session = (current_user.is_a? Customer) ? current_user.id.to_s + '-cart' : current_user.device_id + '-cart'
    redis_cart = redis.get(cart_session)
    unless redis_cart 
      update_cart_session
      cart_session = (current_user.is_a? Customer) ? current_user.id.to_s + '-cart' : current_user.device_id + '-cart'
    end
    current_user.cart.touch
    render json: current_user.cart, order_type: params[:order_type], cart_session: redis.get(cart_session), meta: meta_response(200, 'All OK')
  end


  private

  def parse_json(json_object)
    begin
      items = JSON.parse(json_object)["items"]
    rescue ActiveSupport::JSON.parse_error
      return true, {meta: meta_response(406, "Invalid JSON object")}
    end
    return false, items
  end

  def set_cart_session
    cart_session = (current_user.is_a? Customer) ? current_user.id.to_s + '-cart' : current_user.device_id + '-cart'
    redis_cart = redis.get(cart_session)
    unless redis_cart 
      update_cart_session
      return (current_user.is_a? Customer) ? current_user.id.to_s + '-cart' : current_user.device_id + '-cart'
    end 
    cart_session
  end

  def validate_product_and_customizations(item)
  	menu_item = MenuItem.find_by_id(item)
  	!menu_item.active, menu_item 
  end

end
