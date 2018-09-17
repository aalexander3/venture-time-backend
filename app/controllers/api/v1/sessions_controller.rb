module Api
  module V1
    class SessionsController < ApplicationController

      skip_before_action :authenticate!, only: [:create]

      def create
        @user = Investor.find_by(username: params[:username]) || StartUp.find_by(username: params[:username])

      if @user && @user.authenticate(params["password"])
        render json: {
          token: token_for(@user),
          user_id: @user.id
        } else
            render json: { errors: ["those credentials don't match anything we've got in our database"]}, :status => :unprocessable_entity
          end
      end

    end
  end
end
