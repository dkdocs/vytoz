class Api::V1::CustomersController < Api::V1::ApiController
  include CustomersHelper

  before_filter :is_hotel_logged_in?, :only => [:login]
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_PHONE_REGEX = /\A^[0-9+]{10}$\z/

  respond_to :json

  swagger_controller :customers, "Customer"


  swagger_api :login do
    summary 'Customer Login'

    param :form, :email, :string, :required, "Email ID"
    param :form, :password, :string, :required, "Password"

  end

  def login
    if login_params
      if @customer = Customer.find_by_email(login_params[:email])
        if @customer.authenticate(login_params[:password])
          render json: {status: 200, message: "Customer Logged in!", session_id: generate_customer_session.session_id}
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
    summary 'Customer Signup'

    param :form, :email, :string, :required, "Email ID"
    param :form, :password, :string, :required, "Password"
    param :form, :name, :string, :required, "Name"
    param :form, :phone, :string, :required, "Phone Number"
  end

  def signup
    if signup_params[:email] =~ VALID_EMAIL_REGEX
      if Customer.find_by_email(signup_params[:email])
        render json: {status: 409, message: "User already present"}
      else
        @customer = Customer.new(signup_params)
        if @customer.save
          if @customer.allowed_to_login
            render json: {session_id: generate_customer_session.session_id, status: 200, message: "User registration completed"}
          else
            render json: {session_id: generate_customer_session.session_id, status: 405, message: "Please verify your mobile number"}
          end
        else
          render json: {status: 422, message: customer.errors.full_messages.join(", ")}
        end
      end
    else
      render json: {status: 401, message: "Invalid Params"}
    end
  end

  swagger_api :logout do
    summary 'Customer Logout'

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

  def generate_customer_session
    @customer.sessions.update_all(logout: true)
    @customer.sessions.create(session_id: create_session_string, logout: false)
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
