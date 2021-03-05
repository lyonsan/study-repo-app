class ArticlesTag
  include ActiveModel::Model
  attr_accessor :user_id, :summary, :study_genre_id, :detail, :keyword

  with_options presence: true do
    validates :summary
    validates :detail
  end
  with_options numericality: { other_than: 1, message: 'を選択してください' } do
    validates :study_genre_id
  end



  def save
    article = Article.create(user_id: user_id, summary: summary, study_genre_id: study_genre_id, detail: detail)
    tag = Tag.where(keyword: keyword).first_or_initialize
    tag.save

    ArticleTagRelation.create(article_id: article.id, tag_id: tag.id)
  end
end