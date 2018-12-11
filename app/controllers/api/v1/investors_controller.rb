class Api::V1::InvestorsController < ApplicationController

  before_action :get_investor, only: [:show]

  def index
    investors = InvestorSerializer.new(Investor.all)
    render json: investors
  end

  def show
    investor = InvestorSerializer.new(@investor)
    render json: investor
  end

  def create
    # make some stuff happen with auth here
    @investor = Investor.new(investor_params)
    if @investor.save
      @investor.update(funds_to_invest: 500000)
      investor = InvestorSerializer.new(@investor)
      render json: investor
    else
      render json: {error: "Could not save new investor"}
    end
  end

  private
  def investor_params
    params.require(:investor).permit(:mission, :funds_to_invest, :description, :interests, :logo, :url, :username, :name, :password, :password_confirmation)
  end

  def get_investor
    @investor = Investor.find(params[:id])
  end

end
