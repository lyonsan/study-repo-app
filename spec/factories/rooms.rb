FactoryBot.define do
  factory :room do
    title          { Faker::Team.name }
    purpose_room   { Faker::Lorem.sentence }

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/rooms-index-03.jpeg'), filename: 'rooms-index-03.jpeg')
    end
  end
end
