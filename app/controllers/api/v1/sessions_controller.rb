class Api::V1::SessionsController < ApplicationController

  before_action :authenticate!, only: [:reauth]

  # skip_before_action :authenticate!, only: [:create]

  def create
    @investor = Investor.find_by(username: params[:username])
    @startup = StartUp.find_by(username: params[:username])

    if @investor && @investor.authenticate(params["password"])
      serializer = InvestorSerializer.new(@investor)

      render json: {
        token: token_for(@investor),
        user: serializer.serializable_hash
      } elsif @startup && @startup.authenticate(params["password"])
        serializer = StartUpSerializer.new(@startup)
        render json: {
          token: token_for(@startup),
          user: serializer.serialized_json
        }
      else
        render json: { errors: ["those credentials don't match anything we've got in our database"]}, :status => :unprocessable_entity
      end
  end

  def reauth
    if @startup
      user = StartUpSerializer.new(@start_up).serializable_hash
      render json: user, status: :accepted
    elsif @investor
      user = InvestorSerializer.new(@investor).serializable_hash
      render json: user, status: :accepted
    end
  end

end
