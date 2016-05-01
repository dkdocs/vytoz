class Api::V1::SessionsController < Api::V1::ApiController

	def generate_session
		device = Device.find_by_device_id(params[:device_id])
		if device.nil?
			device = Device.create(device_id: params[:device_id], token: params[:token])
		create_session(device)
	end

	def redis
    	Redis.new(:host => REDIS_CONF['host'], :port => REDIS_CONF['port'], :db => 14)
  	end

	def add_key_expire_time(id)
    	redis.expire(id, Rails.application.secrets.unsigned_session_id_expire_time)
  	end

  	def create_session(customer_device_id, session_id=generate_uuid)
    unless redis.get(session_id)
      redis.set(session_id, customer_device_id)
      add_key_expire_time(session_id)
    end
    session_id
	end

end	

