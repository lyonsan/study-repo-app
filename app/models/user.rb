class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :birthday, presence: true
  with_options numericality: { other_than: 1 } do
    validates :study_genre_id
  end
  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :reports
  has_many :subjects
  has_many :memos
  belongs_to_active_hash :study_genre
  
end
