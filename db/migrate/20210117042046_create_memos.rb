class CreateMemos < ActiveRecord::Migration[6.0]
  def change
    create_table :memos do |t|
      t.references :user, foreign_key: true
      t.references :subject, foreign_key: true
      t.string     :topic, null: false
      t.text       :point
      t.text       :explanation
      t.timestamps
    end
  end
end
