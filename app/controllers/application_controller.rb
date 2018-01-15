class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def set_current_user(user)
  	session[:user_id] = user.id
  end

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
