module Api
  module V1

    class AuthController < ApplicationController

      def create
        user = User.find_by(email: user_params[:email])
        if user && user.authenticate(user_params[:password])
          render json: user
        else
          render json: {error: "User is invalid"}, status: 401
        end
      end

      private

      def user_params
        params.require(:auth).require(:user).permit(:email, :password)
      end

    end
  end
end
