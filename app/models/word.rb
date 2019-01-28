class Word < ApplicationRecord

  validates :content, :meaning, :romaji, presence: true
  belongs_to :lesson
  delegate :number, to: :lesson, prefix: :lesson

  scope :_ids, ->(ids) {
    where(id: ids)
  }

  scope :_not_ids, ->(ids) {
    where.not(id: ids)
  }

  scope :random, -> {
    order('RAND()')
  }
end
