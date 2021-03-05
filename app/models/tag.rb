class Tag < ApplicationRecord
  has_many :article_tag_relations
  has_many :article, through: :article_tag_relations

  validates :keyword, uniqueness: true
end
