class Memo < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  has_one_attached :image
  validates :topic, presence: true

  def self.search(search)
    if search != ''
      Memo.where('topic LIKE(?)',
                 "%#{search}%").or(Memo.where('point LIKE(?)',
                                              "%#{search}%")).or(Memo.where('explanation LIKE(?)', "%#{search}%"))
    end
  end
end
