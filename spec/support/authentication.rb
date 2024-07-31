module Authentication
  def http_basic_auth_header
    @user = User.first_or_create(email:'x@x.com', password: 123456)
    { 'HTTP_AUTHORIZATION':
      ActionController::HttpAuthentication::Basic.encode_credentials(
        @user.email,@user.password)
    }
  end
end