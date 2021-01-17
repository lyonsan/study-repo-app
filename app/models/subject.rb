class Subject < ApplicationRecord
  belongs_to :user
  has_many :memos
  validates :name, presence: true
end
