class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  def require_login
    not_authenticated unless current_user.signed_in?
  end

  def not_authenticated
    flash[:warning] = 'Please sign in first.'
    redirect_to root_url
  end

  private
  def current_user
    @current_user ||= User.find(session[:user_id]).decorate if session[:user_id]
    @current_user ||= User.new.decorate
  end
  helper_method :current_user
end
