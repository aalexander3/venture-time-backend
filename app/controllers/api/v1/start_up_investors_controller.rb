class Api::V1::StartUpInvestorsController < ApplicationController
  before_action :findUser, only: [:create]

  def index
    @startup_investors = StartUpInvestor.all
    render json: @startup_investors
  end

  def create
    @conversation = StartUpInvestor.find_or_create_by(investor: @investor, start_up: @startup)
    if @conversation
      serialized_data = StartUpInvestorSerializer.new(@conversation).serializable_hash
      ActionCable.server.broadcast 'start_up_investors_channel', serialized_data
      head :ok
    else
      render json: {errors: "Could not save this connection!"}
    end
  end

  private

  def findUser
    @investor = Investor.find_by(username: params[:username])
    @startup = StartUp.find(params[:start_up_id])
  end

  def getUserParams
    require(:investor).permit(:username, :id, :messages)
  end

end
