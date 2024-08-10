class ApplicationController < ActionController::API

    before_action :authorize_user

    def current_user
        @current_user
    end

    def authorize_user
        authorization_token = request.headers["Authorization"]

        Rails.logger.info authorization_token

        if !authorization_token
            render status: 401
            return
        end

        user = User.where(auth_token: authorization_token).first

        puts "in authorize user"

        if user.present?
            @current_user = user
        else
            render status: 401, json: {message: "Unauthorized action. Login first."}
        end
    end

end
