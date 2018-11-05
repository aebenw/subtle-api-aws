module Api
  module V1
    class BlocksController < ApplicationController

      def index
        blocks = Block.all
        render json: blocks
      end

      def create
        block = Block.new(channel_params)
        if block.save
          channels_arr = params["block"]["channels"].map{|x| Channel.find(x)}
          channel.users.push(channels_arr)
          byebug
          render json: block
        end
      end

      private

      def channel_params
        params.require(:channel).permit(:name, :user_id, :channels)
      end

    end
  end
end
