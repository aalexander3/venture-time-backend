module Api
  module V1
    class StartUpsController < ApplicationController

      def index
        render json: StartUp.all
      end

      def create
        @startup = @startup.new(start_up_params)
        if @startup.save
          @startup.update(funds_needed: 30000)
          render json: StartUp.all
        end
      end

      private
      def start_up_params
        params.require(:startup).permit(:password, :password_confirmation, :mission, :description, :interests, :logo, :url, :username, :name)
      end

    end
  end
end
