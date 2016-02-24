class AccountsController < ApplicationController
  def index
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(acc_params)
    if @account.save
      session[:account_id] = @account.id
      flash[:notice] = "You have successfully signed up!"
      redirect_to root_path
    else
      render :new
    end
  end

private
  def acc_params
    params.require(:account).permit(:username, :email, :password, :password_confirmation)
  end
end
