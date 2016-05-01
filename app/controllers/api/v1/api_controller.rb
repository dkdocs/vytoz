class Api::V1::ApiController < ApplicationController

def authenticate
    session = Session.where(session_id: request.headers['session-id'], logout: false).first
    if session.present?
    	@user = session.login 
    else
    	device_id = redis.get(session_id)
    	@user = Device.find_by_device_id(device_id)
    end
    unless @user
  		render json: {meta: meta_response(498, "Unauthorized")}, status: 401
    end
  end

def current_user
	@user
end

def update_cart_session
    if current_user.is_a? Customer
      redis.set(current_user.id.to_s + '-cart', request.headers['session-id'])
    else
      redis.set(current_user.device_id + '-cart', request.headers['session-id'])
    end
end

end