module Api
  module V1
    class StartUpInvestorsController < ApplicationController
      before_action :findUser, only: [:create]

      def index
        @startup_investors = StartUpInvestor.all
        render json: @startup_investors
      end

      def create
        @startup = StartUpInvestor.new(investor: @investor, start_up: @startup)
        if @startup.save
          render json: @startup
        else
          render json: {errors: "unable to process your damn request"}
        end
      end

      private

      def findUser
        @investor = Investor.find_by(username: params[:username])
        @startup = StartUp.find(params[:start_up_id])
      end

      def getUserParams
        require(:investor).permit(:username, :id)
      end

    end
  end
end
