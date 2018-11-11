module Api
  module V1
    class BlocksController < ApplicationController

      def index
        blocks = Block.all
        render json: blocks
      end

      def show

        block = Block.find(params[:id])
        render json: block
      end

      def create
        block = Block.new(content: block_params[:content], user_id: block_params[:user_id])
        if block.save
          channels_arr = params[:channels].map{|x| Channel.find(x)}
          block.channels.push(channels_arr)
          render json: block
        end
      end

      private

      def block_params
        params.require(:block).permit(:content, :user_id, :file)
      end

    end
  end
end
