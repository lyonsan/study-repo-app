FactoryBot.define do
  factory :chat_user do
    association :user
    association :chat
  end
end
