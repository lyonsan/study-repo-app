class Room < ApplicationRecord
  before_create :default_image
  has_many :room_users
  has_many :users, through: :room_users, validate: false
  has_one_attached :image
  with_options presence: true do
    validates :title
    validates :purpose_room
  end
  def default_image
    if !self.image.attached?
      self.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'rooms-index-02.jpeg')), filename: 'rooms-index-02.jpeg', content_type: 'image/jpeg')
    end
  end
end
