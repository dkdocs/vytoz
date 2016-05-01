module CustomersHelper

def is_hotel_logged_in?
	unless Session.find_by("session_id = ? and login_type = ?", params[:session_id], "Hotel").present?
		render json: {status: 401, message: "Please contact hotel manager."}
	end
end

end
