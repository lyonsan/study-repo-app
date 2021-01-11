class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true
      t.time       :study_time, null: false
      t.time       :concentrated_time, null: false
      t.text       :good_way, null: false
      t.binary     :achieved_or_not, null: false
      t.text       :go_wrong
      t.text       :tomorrow_plan, null: false
      t.text       :study_content, null: false
      t.text       :advice, null: false
      t.timestamps
    end
  end
end
