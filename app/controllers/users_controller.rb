class UsersController < ApplicationController

    def create
        user = User.create(user_params)
        if user.valid?
            render json: user, status: :created
        else
            render json: {error: user.errors.full_message}, status: :unprocessable_entity
        end
    end

    private

    def user_params
        params.permit(:username, :password, :password_confirmation)
    end


end
