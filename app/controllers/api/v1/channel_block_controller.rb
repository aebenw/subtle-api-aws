module Api
  module V1


    class ChannelBlockController < ApplicationController

      def create
        c = ChannelBlock.new(cb_params)
        if c.save
          render json: {message: "very good"}
        else render json: {errors: c.errors, params: cb_params}
        end

      end

      private

      def cb_params
        params.require(:channel_block).permit(:block_id, :channel_id)
      end


    end



  end
end
