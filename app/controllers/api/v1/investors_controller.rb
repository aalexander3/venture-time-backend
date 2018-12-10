class Api::V1::InvestorsController < ApplicationController

  def index
    render json: Investor.all
  end

  def create
    @investor = Investor.new(investor_params)
    if @investor.save
      @investor.update(funds_to_invest: 500000)
      render json: Investor.all
    end
  end

  private
  def investor_params
    params.require(:investor).permit(:mission, :funds_to_invest, :description, :interests, :logo, :url, :username, :name, :password, :password_confirmation)
  end

end
