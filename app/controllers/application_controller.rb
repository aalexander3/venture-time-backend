class ApplicationController < ActionController::API

  def get_secret_key
    ENV["SECRET_KEY"]
  end

  def issue_token(payload)
    JWT.encode(payload, get_secret_key)
  end

  def token_for(user)
    issue_token({ id: user.id, username: user.username })
  end

  def user_json(user)
    {
      token: token_for(user),
      user_id: user.id
    }
  end

  def auth_headers
    request.headers['Authorization']
  end

  def current_user
    if auth_headers
      token = auth_headers
      begin
        decoded_token = JWT.decode(token, get_secret_key)
        user = decoded_token[0]
        @start_up = StartUp.find_by(user)
        if @start_up
          @start_up
        else
          @investor = Investor.find_by(user)
        end
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def logged_in?
    !!current_user
  end

  def authenticate!
    render json: { get_lost: true }, status: 401 unless logged_in?
  end

  # def authorized?
  #   current_user_id.to_s == params[:user_id]
  # end

end
