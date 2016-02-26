class AccountsController < ApplicationController
  def index
  end

  def show
    @account = Account.find(params[:id])
    @comments = Comment.where(account_id: @account.id)
    @articles = Article.where(account_id: @account.id)
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

  def destroy
    @account = Account.find(params[:id])
    @account.destroy
    redirect_to root_path
  end

private
  def acc_params
    params.require(:account).permit(:username, :email, :password, :password_confirmation)
  end
end
