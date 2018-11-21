module Api
  module V1


    class FeedsController < ApplicationController

      def show
        byebug
        render json: Feed.initialize(params[:id])
      end

    private

    def feed_params
      params.require(:feed).permit(:user_id)
    end


    end


  end
end
