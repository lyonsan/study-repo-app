class Report < ApplicationRecord
  belongs_to :user
  belongs_to :room
  # バリデーションを記入する
  with_options presence: true do
    validates study_time
    validates concentrated_time
    validates good_way
    validates achieved_or_not
    validates tomorrow_plan
    validates study_content
    validates advice
  end
  validates go_wrong, presence: true, if: achieved_or_not == 0
end
