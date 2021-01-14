class Report < ApplicationRecord
  belongs_to :user
  belongs_to :room
  with_options presence: true do
    validates :study_time
    validates :concentrated_time
    validates :good_way
    validates :tomorrow_plan
    validates :study_content
    validates :advice
  end
  validates :achieved, inclusion: { in: [true, false] }
  validates :go_wrong, presence: true, unless: :achieved
  validate :concentrated_check

  def concentrated_check
    if study_time.present? && concentrated_time.present? && concentrated_time > study_time
      errors.add(:concentrated_time,
                 'is shorter than Study Time')
    end
  end
end
