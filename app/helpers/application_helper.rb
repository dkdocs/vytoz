module ApplicationHelper
	
	def meta_response(status_code, msg)
	    case status_code
	    when 200
	      { code: 200, status: 'OK', message: msg, error: false, version: "v1.0", copyright: "#{I18n.t 'copyright'}" }
	    when 201
	      { code: 201, status: 'OK', message: msg, error: false, version: "v1.0", copyright: "#{I18n.t 'copyright'}" }
	    else
	      { code: status_code, status: 'Not OK', message: msg, error: true, version: "v1.0", copyright: "#{I18n.t 'copyright'}" }
	    end
  	end

end
