FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.free_email }
    password              { '111aaa' }
    password_confirmation { password }
    nickname              { Faker::Name.initials(number: 2) }
    birthday              { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
    study_genre_id        { Faker::Number.between(from: 2, to: 6) }
    self_introduction     { Faker::Lorem.sentence }
  end
end
