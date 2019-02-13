class QuestionService

  attr_accessor :question

  def initialize(word)
    self.question = {
      word_id: word.id,
      content: word.content,
      right_ans: word.meaning
    }
    add_answer
  end

  def add_answer
    answers = [question[:right_ans]]
    answers += Word._ids(Word._not_ids(question[:word_id]).pluck(:id).sample(3)).pluck(:meaning)
    answers.shuffle.each_with_index do |ans, index|
      question["ans_#{index + 1}".to_sym] = ans
    end
  end
end


