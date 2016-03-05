class ManagersController < ApplicationController
include ManagersHelper
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
VALID_PHONE_REGEX = /\A^[0-9+]{10}$\z/

def login
	if login_params
		if @manager = Manager.find_by_email(login_params[:email])
			if @manager.authenticate(login_params[:password])
				render json: {status: 200, message: "Manager Logged in!", session_id: generate_session.session_id}
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
	
	def signup
	if signup_params[:email] =~ VALID_EMAIL_REGEX
		if Manager.find_by_email(signup_params[:email])
      render json: {status: 409, message: "User already present"}
    else
      @manager = Manager.new(signup_params)
      if @manager.save
        if @manager.allowed_to_login
        render json: {session_id: generate_session.session_id, status: 200, message: "Manager registered"}
        else
          render json: {session_id: generate_session.session_id, status: 405, message: "Please verify your mobile number"}
        end
      else
        render json: {status: 422, message: manager.errors.full_messages.join(", ")}
      end
    end
    else
	  	render json: {status: 401, message: "Invalid Params"}
	  end
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
		@manager.sessions.update_all(logout: true)
		@manager.sessions.create(session_id: create_session_string, logout: false)	
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
