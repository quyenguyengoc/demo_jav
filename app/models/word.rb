class Word < ApplicationRecord

  validates :content, :meaning, :romaji, presence: true
  belongs_to :lesson

  def lesson_number
    lesson.number
  end
end
