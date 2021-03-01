class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order(created_at: 'DESC')
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:study_genre_id, :summary, :detail).merge(user_id: current_user.id)
  end
end
