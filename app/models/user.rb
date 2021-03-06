class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には半角英字と半角数字を両方含めてください'
  with_options presence: true do
    validates :nickname
    validates :birthday
  end
  with_options numericality: { other_than: 1, message: 'を選択してください' } do
    validates :study_genre_id
  end
  validates :email, uniqueness: { case_sensitive: false }
  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :reports
  has_many :subjects
  has_many :memos
  has_many :chat_users
  has_many :chats, through: :chat_users
  has_many :messages
  has_many :articles
  belongs_to_active_hash :study_genre

  def self.search(search, study_genre)
    if search != '' && study_genre != '1'
      User.where('nickname LIKE(?)',
                 "%#{search}%").or(User.where('self_introduction LIKE(?)',
                                              "%#{search}%")).where(study_genre_id: study_genre)
    elsif search != '' && study_genre == '1'
      User.where('nickname LIKE(?)',
                 "%#{search}%").or(User.where('self_introduction LIKE(?)',
                                              "%#{search}%"))
    elsif search == '' && study_genre != '1'
      User.where(study_genre_id: study_genre)
    else
      User.all
    end
  end
end
