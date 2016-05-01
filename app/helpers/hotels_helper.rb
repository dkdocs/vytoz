module HotelsHelper

def is_manager_logged_in
	unless Session.where("session_id = ? and login_type = ?", params[:session_id], "Manager").last.active
		render json: {status: 401, message: "Please contact hotel manager."}
	end
end

end
