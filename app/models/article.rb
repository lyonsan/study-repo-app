class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :study_genre
  has_many :article_tag_relations, dependent: :destroy
  has_many :tags, through: :article_tag_relations
  has_many :users, through: :likes
  has_many :likes
  with_options numericality: { other_than: 1, message: 'を選択してください' } do
    validates :study_genre_id
  end
  with_options presence: true do
    validates :summary
    validates :detail
  end

  def self.search(search, study_genre, tag)
    if tag.present?
      Tag.find(tag).articles
    else
      if search != '' && study_genre != '1'
        Article.where('summary LIKE(?)',
                      "%#{search}%").or(Article.where('detail LIKE(?)',
                                                      "%#{search}%")).where(study_genre_id: study_genre)
      elsif search != '' && study_genre == '1'
        Article.where('summary LIKE(?)',
                      "%#{search}%").or(Article.where('detail LIKE(?)',
                                                      "%#{search}%"))
      elsif search == '' && study_genre != '1'
        Article.where(study_genre_id: study_genre)
      else
        Article.all
      end
    end
  end

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
