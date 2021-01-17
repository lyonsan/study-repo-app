class Memo < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  has_one_attached :image
  validates :topic, presence: true
end
