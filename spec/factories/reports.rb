FactoryBot.define do
  factory :report do
    association :user
    association :room
    study_time { '03:00' }
    # study_time { Faker::Time.between(from DateTime.now - 1 to DateTime.now).strftime("%H:%M") }
    concentrated_time { '02:00' }
    good_way { Faker::Lorem.sentence }
    achieved { false }
    go_wrong { Faker::Lorem.sentence }
    tomorrow_plan { Faker::Lorem.sentence }
    study_content { Faker::Lorem.sentence }
    advice { Faker::Lorem.sentence }
  end
end
