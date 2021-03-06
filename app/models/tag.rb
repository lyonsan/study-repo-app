class Tag < ApplicationRecord
  has_many :article_tag_relations
  has_many :articles, through: :article_tag_relations

  validates :tag_name, uniqueness: true
end
