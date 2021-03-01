class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :study_genre
  with_options numericality: { other_than: 1, message: 'を選択してください' } do
    validates :study_genre_id
  end
  with_options presence: true do
    validates :summary
    validates :detail
  end
end
