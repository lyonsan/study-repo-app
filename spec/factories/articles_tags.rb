FactoryBot.define do
  factory :articles_tag do
    user_id { 1 }
    summary { Faker::Lorem.sentence }
    tag_name { Faker::Lorem.sentence }
    detail { Faker::Lorem.sentence }
    study_genre_id { Faker::Number.between(from: 2, to: 6) }
  end
end
