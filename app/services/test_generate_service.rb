class TestGenerateService

  attr_accessor :lesson_numbers, :total_questions, :high_priority, test

  def initialize(test_params, test)
    self.test = test
    self.high_priority = test_params[:high_priority].to_i > 0
    self.total_questions = test_params[:total_questions].to_i
    self.lesson_numbers = test_params[:lesson_numbers].reject(&:empty?).map(&:to_i)
  end

  def generate_questions
    words = Word.random.limit(total_questions)
  end
end
