class ArticlesController < ApplicationController
  before_action :authorize, except: [:index, :show]
  after_action :allow_iframe, only: :embed

  def embed
  end

  def index
    @articles = Article.all.order('created_at DESC')
  end

  def show
    @article = Article.find(params[:id])
    @comments = Comment.where(article_id: @article.id)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.account = current_account
    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if params[:vote] == "up"
      @article.upvote_from current_account
      redirect_to article_path(@article)
    elsif params[:vote] == "down"
      @article.downvote_from current_account
      redirect_to article_path(@article)
    elsif @article.update_attributes(article_params)
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def vote
    @article = Article.find(params[:id])

    if params[:vote] == "up"
      @article.upvote_from current_account
      redirect_to articles_path
    elsif params[:vote] == "down"
      @article.downvote_from current_account
      redirect_to articles_path
    elsif @article.update_attributes(article_params)
      redirect_to articles_path
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end



private
  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end
  def article_params
    params.require(:article).permit(:title,:description)
  end
end
