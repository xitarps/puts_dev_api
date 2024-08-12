module Authenticatable
  extend ActiveSupport::Concern

  include ActionController::HttpAuthentication::Basic::ControllerMethods

  private

  def authorize_user!
    fetch_user_by_session && check_session_expiration if session[:session]
    render json: {}, status: :unauthorized unless @user || basic_authenticate!
  end

  def basic_authenticate!
    authenticate_with_http_basic do |email, password|
      fetch_user_by_email(email)
      @user&.valid_password?(password)
    end
  end

  def fetch_user_by_email(email)
    @user = User.find_by(email: email)
  end

  def fetch_user_by_session
    @user = User.where(session: session[:session]).first
  end

  def check_session_expiration
    if @user&.session_expires_at < Time.current
      @user.update(session: nil, session_expires_at: nil)
      @user = nil
      session[:session] = nil
    end
  end
end
