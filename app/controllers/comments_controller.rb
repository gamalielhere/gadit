class CommentsController < ApplicationController
  before_action :authorize

  def index
    @comments = @comment = Comment.find(params[:id])
  end

  def new

  end

  def edit
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    respond_to do |format|
      if @comment.update_attributes(comment_params)
        format.json { respond_with_bip(@comment) }
      else
        format.html { render :edit }
      end
    end
  end

  def vote
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])

    if params[:vote] == "up"
      @comment.upvote_from current_account
      redirect_to article_path(@article)
    elsif params[:vote] == "down"
      @comment.downvote_from current_account
      redirect_to article_path(@article)
    elsif @comment.update_attributes(comment_params)
      redirect_to article_path(@article)
    else
      render :edit
    end
  end


  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    @comment.account_id = current_account.id
    @comment.save
    redirect_to article_path(@article)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to article_path(@comment.article)
  end

private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
