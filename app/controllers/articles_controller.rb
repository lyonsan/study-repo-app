class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_article, only: [:show, :edit]
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

  def show
  end

  def edit
    redirect_to root_path unless user_signed_in? && @article.user == current_user
    @form = ArticlesTag.new(summary: @article.summary, detail: @article.detail, study_genre_id: @article.study_genre_id)
  end

  def update
    @form = ArticlesTag.new(update_params)
    if @form.valid?
      @form.update
      redirect_to articles_path
    else
      render :edit
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:articles_tag).permit(:study_genre_id, :summary, :detail, :keyword).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:articles_tag).permit(:study_genre_id, :summary, :detail, :keyword).merge(user_id: current_user.id, article_id: params[:id])
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
