class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'include both letters and numbers'
  with_options presence: true do
    validates :nickname
    validates :birthday
  end
  with_options numericality: { other_than: 1, message: 'must be chosen' } do
    validates :study_genre_id
  end
  validates :email, uniqueness: { case_sensitive: false }
  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :reports
  belongs_to_active_hash :study_genre
end
