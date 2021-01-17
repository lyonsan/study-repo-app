FactoryBot.define do
  factory :memo do
    association :user
    association :subject
    topic { Faker::ProgrammingLanguage.name }
    point { Faker::Lorem.sentence }
    explanation { Faker::Lorem.sentence }
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/rooms-index-03.jpeg'), filename: 'rooms-index-03.jpeg')
    end
  end
end
