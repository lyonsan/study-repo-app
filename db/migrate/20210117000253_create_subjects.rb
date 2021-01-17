class CreateSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects do |t|
      t.references :user, foreign_key: true
      t.string     :name, null: false
      t.text       :purpose_subject
      t.timestamps
    end
  end
end
