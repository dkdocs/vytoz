class Api::V1::HotelsController < Api::V1::ApiController
include HotelsHelper
before_filter :is_manager_logged_in, :only => [:signup, :login]
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_PHONE_REGEX = /\A^[0-9+]{10}$\z/


respond_to :json

	swagger_controller :hotels, "Hotel"


	swagger_api :login do
	summary 'Hotel Login'
	
	param :form, :email, :string, :required, "Email ID"
  param :form, :password, :string, :required, "Password"
   
	end


def login
	if login_params
		if @hotel = Hotel.find_by_email(login_params[:email])
			if @hotel.authenticate(login_params[:password])
				render json: {status: 200, message: "Hotel Logged in!", session_id: generate_session.session_id}
			else
				render json: {status: 405, message: "Password does not match"}
			end
		else
			render json: {status: 404, message: "Please sign up first."}
		end
	else
		render json: {status: 401, message: "Invalid params"}
	end
end
	
	swagger_api :signup do
	summary 'Hotel Signup'
	
	param :form, :email, :string, :required, "Email ID"
  param :form, :password, :string, :required, "Password"
  param :form, :name, :string, :required, "Name"
  param :form, :phone, :string, :required, "Phone Number"
	end

	def signup
		if signup_params[:email] =~ VALID_EMAIL_REGEX
			if Hotel.find_by_email(signup_params[:email])
	      render json: {status: 409, message: "User already present"}
	    else
	      @hotel = Hotel.new(signup_params)
	      if @hotel.save
	        if @hotel.allowed_to_login
	          render json: {session_id: generate_session.session_id, status: 200, message: "Hotel registered."}
	        else
	          render json: {session_id: generate_session.session_id, status: 405, message: "Please verify your mobile number"}
	        end
	      else
	        render json: {status: 422, message: hotel.errors.full_messages.join(", ")}
	      end
	    end
    else
	  	render json: {status: 401, message: "Invalid Params"}
	  end
	end

	swagger_api :logout do
	summary 'Manager Logout'
	
	param :form, :session_id, :string, :required, "Session ID"
   
	end


	def logout
		if session = Session.find_by_session_id(params[:session_id])
			if session.update(logout: false)
				render json: {status: 200, message: "Logout done"}
			else
				render json: {status: 401, message: "Something went wrong"}
			end
		else
			render json: {status: 404, message: "Session not found."}
		end
	end

private

	def generate_session
		@hotel.sessions.update_all(logout: true)
		@hotel.sessions.create(session_id: create_session_string, logout: false)	
	end

	def create_session_string
		SecureRandom.hex(10)
	end

	def login_params
		params.permit(:email, :password)
	end

	def signup_params
		params.permit(:name, :email, :password, :phone)
	end

end
