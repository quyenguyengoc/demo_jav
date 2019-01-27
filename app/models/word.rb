class Word < ApplicationRecord

  validates :content, :meaning, :romaji, presence: true
  belongs_to :lesson

  scope :_ids, ->(ids) {
    where(id: ids)
  }

  scope :_not_ids, ->(ids) {
    where.not(id: ids)
  }

  def lesson_number
    lesson.number
  end
end
