class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users
  has_many :reports
  has_one_attached :image
  validates :title, presence: true
end
