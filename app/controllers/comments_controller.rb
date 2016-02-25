class CommentsController < ApplicationController
  before_action :authorize
  def index

  end
  def edit
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    @comment.account_id = current_account.id
    @comment.save
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
