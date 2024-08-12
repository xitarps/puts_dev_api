module Authentication
  def http_basic_auth_header
    @user = User.first_or_create(email:'x@x.com', password: 123456)
    { 'HTTP_AUTHORIZATION':
      ActionController::HttpAuthentication::Basic.encode_credentials(
        @user.email,@user.password)
    }
  end

  def sign_in(user)
    user.renew_session!
    session = { session: user.session }
    allow_any_instance_of(Api::V1::ApplicationController).to receive(:session).and_return(session)
  end
end