module Api
  module V1
    class InvestorsController < ApplicationController

      def index
        render json: Investor.all
      end

      def create
        @investor = Investor.new(investor_params)
        if @investor.save
          render json: Investor.all
        end
      end

      private
      def investor_params
        params.require(:investor).permit(:mission, :description, :interests, :logo, :url, :username, :name)
      end

    end
  end
end
