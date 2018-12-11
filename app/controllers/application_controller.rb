class ApplicationController < ActionController::API

  include ActionController::HttpAuthentication::Token::ControllerMethods

  def get_secret_key
    ENV["SECRET_KEY"]
  end

  def issue_token(payload)
    JWT.encode(payload, get_secret_key)
  end

  def token_for(user)
    issue_token({ user_id: user.id, username: user.username })
  end

  def user_json(user)
    {
      token: token_for(user),
      user_id: user.id
    }
  end

  def current_user_id
    authenticate_or_request_with_http_token do |jwt_token, options|
      begin
        decoded_token = JWT.decode(jwt_token, get_secret_key)
        decoded_token[0]["user_id"]
      rescue JWT::DecodeError
        nil
      end

    end
  end

  def logged_in?
    !!current_user_id
  end

  def authenticate!
    render json: { get_lost: true }, status: 401 unless logged_in?
  end

  def authorized?
    current_user_id.to_s == params[:user_id]
  end

end
