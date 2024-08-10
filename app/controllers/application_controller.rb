class ApplicationController < ActionController::API
    before_action :authorize_user
  
    def current_user
      @current_user ||= authorize_user
    end
  
    def authorize_user
      return @current_user if @current_user
  
      authorization_token = request.headers["Authorization"]
  
      Rails.logger.info authorization_token
  
      if authorization_token.blank?
        render status: 401
        return
      end
  
      @current_user = User.find_by(auth_token: authorization_token)
  
      if @current_user
        @current_user
      else
        render status: 401, json: { message: "Unauthorized action. Login first." }
      end

      @current_user
    end
  end