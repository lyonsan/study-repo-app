class StudyGenre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--'},
    { id: 2, name: 'プログラミング'},
    { id: 3, name: '資格系(FP/宅建/簿記等)'},
    { id: 4, name: '英語系(TOEIC/英検等)'},
    { id: 5, name: 'デザイン/動画制作'},
    { id: 6, name: 'その他'}
  ]

  include ActiveHash::Associations
  has_many :users
end
