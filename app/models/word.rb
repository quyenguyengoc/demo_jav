class Word < ApplicationRecord

  validates :content, :meaning, :romanji, presence: true
  belongs_to :lesson

  def lesson_number
    lesson.number
  end
end
