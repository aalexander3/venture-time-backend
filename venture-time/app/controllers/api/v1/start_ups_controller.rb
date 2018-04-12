module Api
  module V1
    class StartUpsController < ApplicationController

      def index
        render json: StartUp.all
      end
    end
  end
end
