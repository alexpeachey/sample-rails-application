class SessionsController < ApplicationController
  before_filter :require_login, only: [:destroy]

  def create
    omniauth = ActionController::Parameters.new(env['omniauth.auth'])
    authentication = Authentication.authenticate(omniauth.permit(:provider, :uid, info: [:name, :email]))
    if authentication.authenticated?
      session[:user_id] = authentication.user_id
      redirect_to root_url, notice: 'Signed in.'
    else
      session[:user_id] = nil
      flash[:error] = 'Unable to sign in.'
      redirect_to root_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out."
  end
end