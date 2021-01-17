FactoryBot.define do
  factory :subject do
    association :user
    name { Faker::Team.name }
    purpose_subject   { Faker::Lorem.sentence }
  end
end
