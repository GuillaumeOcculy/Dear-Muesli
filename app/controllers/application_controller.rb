class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_order

  helper_method :current_user, :current_order

  def set_current_user(user, remember_me)
  	cookies.permanent.signed[:auth_token] = user.auth_token if remember_me
  	cookies.signed[:auth_token] = user.auth_token
  end

  def current_user
  	@current_user ||= User.find_by(auth_token: cookies.signed[:auth_token]) if cookies.signed[:auth_token]
  end

  def current_order
    @current_order ||= Order.find(cookies.permanent[:order_id]) if cookies.permanent[:order_id]
  end
end
