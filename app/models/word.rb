class Word < ApplicationRecord

  validates :content, :meaning, :romaji, presence: true

  belongs_to :lesson
  has_many :questions
  delegate :number, to: :lesson, prefix: :lesson

  scope :_ids, ->(ids) {
    where(id: ids)
  }

  scope :_not_ids, ->(ids) {
    where.not(id: ids)
  }

  scope :_lesson_ids, ->(lesson_ids) {
    where(lesson_id: lesson_ids)
  }

  scope :random, -> {
    order(Arel.sql(Settings.random_scope[ActiveRecord::Base.connection.instance_values["config"][:adapter]]))
  }

  scope :_correct_rate_asc, -> {
    order(correct_rate: :asc)
  }

  scope :_count_by_lesson, ->(lesson_ids) {
    where(lesson_id: lesson_ids).group(:lesson_id).count
  }

  def to_romaji
    content.romaji
  end
end
