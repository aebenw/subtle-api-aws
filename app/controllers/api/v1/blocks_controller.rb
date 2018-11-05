module Api
  module V1
    class BlocksController < ApplicationController

      def index
        blocks = Block.all
        render json: blocks
      end

    end
  end
end
