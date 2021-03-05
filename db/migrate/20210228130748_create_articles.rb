class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.references :user, foreign_key: true
      t.string :summary, null: false
      t.integer :study_genre_id, null: false
      t.text :detail, null: false
      t.timestamps
    end
  end
end
