class SessionsController < ApplicationController
  after_action :allow_iframe, only: :embed
  def new

  end

  def create
    account = Account.find_by(email: params[:email])
    if account && account.authenticate(params[:password])
      session[:account_id] = account.id
      redirect_to root_path, notice: 'Logged in!'
    else
      flash.now.alert = "Can't find information in our database. Please try again!"
      render :new
    end
  end

  def destroy
    session[:account_id] = nil
    redirect_to root_path, notice: 'Logged out!'
  end

private
  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end
end
