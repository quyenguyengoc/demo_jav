class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.integer :number, null: false, unique: true

      t.timestamps
    end
  end
end
