class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users, validate: false
  has_one_attached :image
  validates :title, presence: true
end
