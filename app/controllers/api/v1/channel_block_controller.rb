module Api
  module V1


    class ChannelBlockController < ApplicationController

      def create

        cb = ChannelBlock.new(cb_params)
        if cb.save

          res = cb.channel
          render json: res
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
