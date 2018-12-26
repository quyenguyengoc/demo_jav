class CreateTestDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :test_details do |t|
      t.integer :test_id, null: false
      t.integer :word_id, null: false
      t.text :user_answer, null: false
      t.boolean :correct, default: false

      t.timestamps
    end
  end
end
