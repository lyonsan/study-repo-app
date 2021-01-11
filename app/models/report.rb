class Report < ApplicationRecord
  belongs_to :user
  belongs_to :room
  # バリデーションを記入する
  # study_time
  # concentrated_time
  # good_way
  # achieved_or_not
  # go_wrong
  # tomorrow_plan
  # study_content
  # advice
end
