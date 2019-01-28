class Test < ApplicationRecord

  attr_accessor :high_priority, :lesson_numbers

  validates :total_questions, presence: true
  validates :correct_question_count, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :user
  has_many :test_detail
end
