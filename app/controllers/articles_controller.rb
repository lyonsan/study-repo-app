class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @articles = Article.all.order(created_at: 'DESC')
  end

  def new
    @article = ArticlesTag.new
  end

  def create
    @article = ArticlesTag.new(article_params)
    if @article.valid?
      @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:articles_tag).permit(:study_genre_id, :summary, :detail, :keyword).merge(user_id: current_user.id)
  end
end
