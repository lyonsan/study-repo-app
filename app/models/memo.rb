class Memo < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  validates :topic, presence: true
end
