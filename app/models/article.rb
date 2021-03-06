class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :study_genre
  has_many :article_tag_relations, dependent: :destroy
  has_many :tags, through: :article_tag_relations
  with_options numericality: { other_than: 1, message: 'を選択してください' } do
    validates :study_genre_id
  end
  with_options presence: true do
    validates :summary
    validates :detail
  end
end
