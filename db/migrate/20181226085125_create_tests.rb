class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.integer :total_questions, null: false
      t.integer :correct_question_count, default: 0
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
