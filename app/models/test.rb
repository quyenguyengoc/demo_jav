class Test < ApplicationRecord

  attr_accessor :high_priority, :lesson_numbers

  validates :total_questions, presence: true
  validates :correct_question_count, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :user
  has_many :questions

  accepts_nested_attributes_for :questions

  def create_questions(test_params)
    high_priority = test_params[:high_priority].to_i > 0
    lesson_numbers = test_params[:lesson_numbers].reject(&:empty?).map(&:to_i)
    if high_priority
      words = Word._lesson_ids(lesson_numbers)._correct_rate_asc.limit(total_questions)
    else
      words = Word._lesson_ids(lesson_numbers).random.limit(total_questions)
    end
    questions = words.shuffle.map do |word|
      question = QuestionService.new(word).question
      Question.new(word_id: question[:word_id],
        answer_1: question[:ans_1], answer_2: question[:ans_2],
        answer_3: question[:ans_3], answer_4: question[:ans_4]
      )
    end
    self.questions = questions
  end

  def test_number
    "#{created_at.strftime('%Y%m%d')}_#{id}"
  end

  def update_correct_question_count
    count = 0
    questions.includes(:word).each do |question|
      count += 1 if question.user_answer == question.word_meaning
    end
    self.update(correct_question_count: count)
  end
end
