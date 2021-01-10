class Room < ApplicationRecord
  before_create :default_image
  has_many :room_users
  has_many :users, through: :room_users, validate: false
  has_one_attached :image
  with_options presence: true do
    validates :title
    validates :purpose_room
  end
  
end
