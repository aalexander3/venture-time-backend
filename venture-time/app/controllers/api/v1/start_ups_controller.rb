module Api
  module V1
    class StartUpsController < ApplicationController

      def index
        render json: StartUp.all
      end

      def create
        @startup = @startup.new(start_up_params)
        if @startup.save
          render json: StartUp.all
        end
      end

      private
      def start_up_params
        params.require(:startup).permit(:password, :mission, :description, :interests, :logo, :url, :username, :name)
      end

    end
  end
end
