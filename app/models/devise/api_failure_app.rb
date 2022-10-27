module Devise
  class ApiFailureApp < Devise::FailureApp

    def respond
      json_api_error_response
    end

    def json_api_error_response
      self.status        = 401
      self.content_type  = 'application/json'
      self.response_body = { message: i18n_message, success: false }.to_json
    end
  end
end