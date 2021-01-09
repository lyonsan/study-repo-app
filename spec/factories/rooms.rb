FactoryBot.define do
  factory :room do
    title          { Faker::Team.name }
    purpose_room   { Faker::Lorem.sentence }
  end
end
