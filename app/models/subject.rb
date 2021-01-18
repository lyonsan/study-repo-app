class Subject < ApplicationRecord
  belongs_to :user
  has_many :memos, dependent: :destroy
  validates :name, presence: true
end
