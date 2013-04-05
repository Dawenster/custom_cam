class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    @user ||= User.find(session[:id]) if session[:id]
  end

  helper_method :current_user
end
