class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :test_id, null: false
      t.integer :word_id, null: false
      t.text :user_answer, null: true
      t.string :answer_1, null: false
      t.string :answer_2, null: false
      t.string :answer_3, null: false
      t.string :answer_4, null: false

      t.timestamps
    end
  end
end
