FactoryBot.define do
  factory :message do
    association :user
    association :chat
    content { Faker::Lorem.sentence }
  end
end
