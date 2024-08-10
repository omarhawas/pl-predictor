class UsersController < ApplicationController

    skip_before_action :authorize_user, only: [:signup, :login]

    def login
        user = User.where(email: params[:email]).first

        if  user.present? && user.access_code == params[:access_code]
            auth_token = SecureRandom.urlsafe_base64(nil, false)
            user.update(auth_token: auth_token)
            user.save!

            render json: {auth_token: auth_token}, status: 200
        else
            render status: 401
        end
    end

    def signup
        user = User.new(email: params[:email], username: params[:username])

        if user.save
            render json: {message: 'User created'}, status: 200
        else
            render json: {error: 'Failed to create user', message: user.errors.messages}, status: 400
        end
    end

end