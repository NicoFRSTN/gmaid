class SessionsController < ApplicationController
  def GoogleAuth

    access_token = request.env["omniauth.auth"]
    user = User.from_omniauth(access_token)*
    session[:user_id] = user.id
    user.google_token = access_token.credentials.token
    p user
    user.save
  end
end
