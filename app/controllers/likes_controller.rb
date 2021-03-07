class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_like
  def create
    like = current_user.likes.build(article_id: params[:article_id])
    like.save
    redirect_to article_path(params[:article_id])
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, article_id: params[:article_id])
    like.destroy
    redirect_to article_path(params[:article_id])
  end

  private
  
  def set_like
    @article = Article.find(params[:article_id])
  end
end
