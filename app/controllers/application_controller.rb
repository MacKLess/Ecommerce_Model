class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :admin
  helper_method :current_order

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def admin
    unless current_user && current_user.admin?
      flash[:alert] = "You aren't authorized to do that."
      redirect_to '/'
    end
  end

  def current_order
    session[:order_id] ? Order.find(session[:order_id]) : Order.new
  end
end
