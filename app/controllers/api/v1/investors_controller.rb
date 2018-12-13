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
    @investor = Investor.new(investor_params)
    @investor.password = params['password'] if params['password'] == params['password_confirmation']
    if @investor.save
      @investor.update(funds_to_invest: 500000)
      investor = InvestorSerializer.new(@investor)
      render json: {
        token: token_for(@investor),
        user: investor.serializable_hash
      }
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
