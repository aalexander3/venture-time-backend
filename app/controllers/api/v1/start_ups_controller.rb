class Api::V1::StartUpsController < ApplicationController
  before_action :get_startup, only: [:show]

  def index
    start_ups = StartUpSerializer.new(StartUp.all)
    render json: start_ups
  end

  def show
    render json: @startup
  end

  def create
    @startup = @startup.new(start_up_params)
    @startup.password = params['password'] if params['password'] == params['password_confirmation']
    if @startup.save
      @startup.update(funds_needed: 30000)
      serializer = StartUpSerializer.new(@startup)
      render json: {
        token: token_for(@investor),
        user: serializer.serializable_hash
      }
    end
  end

  private
  def start_up_params
    params.require(:startup).permit(:password, :password_confirmation, :mission, :description, :interests, :logo, :url, :username, :name)
  end

  def get_startup
    @startup = StartUp.find(params[:id])
  end

end
