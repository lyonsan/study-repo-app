FactoryBot.define do
  factory :article do
    association :user
    summary { Faker::Lorem.sentence }
    detail { Faker::Lorem.sentence }
    study_genre_id { Faker::Number.between(from: 2, to: 6) }
  end
end
