module Api
  module V1

    class UsersController < ApplicationController

      def index
        @users = User.all
        render json: @users
      end

      def create
        byebug
        user = User.find_by(user_params)
        if users
          render json: user
        else
          render json: {error: "user not found"}
        end
      end

      private

      def user_params
        params.require(:user).permit(:email, :password)
      end


    end
end
end
