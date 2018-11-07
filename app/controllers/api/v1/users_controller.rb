module Api
  module V1

    class UsersController < ApplicationController

      def index
        @users = User.all
        render json: @users
      end

      def show

        user = User.find(params[:id])
        render json: user
      end

      def create
        user = User.new(user_params)
        if user.save
          serialized_data = ActiveModelSerializers::Adapter::Json.new(
            UserSerializer.new(user)
          ).serializable_hash
          token = encode({jwt: user.id})
          render json: {jwt: token, user: serialized_data}
        else
          render json: {error: "account already exists"}
        end
      end

      def content
        num = rand(2)
        content = []
        type = ''
        if num == 0
          content = User.all.sample(10)
          type = 'users'
        elsif num == 1
          content = Channel.all.sample(10)
          type = 'channels'
        elsif num == 2
          content = Block.all.sample(10)
          type = 'blocks'
        end

        render json: content

      end

      private

      def user_params
        params.require(:user).permit(:email, :password, :name)
      end


    end
  end
end
