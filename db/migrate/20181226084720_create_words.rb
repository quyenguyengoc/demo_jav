class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :content, null: false
      t.string :meaning, null: false
      t.string :kanji
      t.string :romaji, null: false
      t.float :correct_rate, default: 0
      t.integer :lesson_id, null: false

      t.timestamps
    end
  end
end
