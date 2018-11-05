module Api
  module V1

    class ChannelsController < ApplicationController

      def index
        channels = Channel.all
        render json: channels
      end

      def create
        channel = Channel.new(channel_params)
        if channel.save
          render json: channel
        end
      end

      private

      def channel_params
        params.require(:channel).permit(:name)
      end

    end




  end
end
