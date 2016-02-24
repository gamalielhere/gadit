class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_account
  def authorize
    redirect_to login_path, alert: 'Not authorized - you must be logged in!' if current_account.nil?
  end
private
  def current_account
    @current_account ||= Account.find_by(id: session[:account_id]) if session[:account_id]
  end
end
