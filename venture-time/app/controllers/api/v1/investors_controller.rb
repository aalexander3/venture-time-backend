module Api
  module V1
    class InvestorsController < ApplicationController

      def index
        render json: Investor.all
      end
    end
  end
end
