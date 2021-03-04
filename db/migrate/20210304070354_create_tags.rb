class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :keyword, null: false, uniqueness: true
      t.timestamps
    end
  end
end
