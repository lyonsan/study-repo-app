class ArticleTag
  include ActiveModel::Model
  attr_accessor :user, :summary, :study_genre_id, :detail, :keyword

  with_options presence: true do
    validates :summary
    validates :study_genre_id
    validates :detail
    validates :keyword
  end



  def save
    article = Article.create(user: current_user, summary: summary, study_genre_id: study_genre_id, detail: detail)
    tag = Tag.create(keyword: keyword)

    ArticleTagRelation.create(article_id: article.id, tag_id: tag.id)
  end
end