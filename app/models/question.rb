class Question

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
    answers +=  Word._ids(Word.pluck(:id).sample(3))._not_ids(question[:word_id]).pluck(:meaning)
    answers.shuffle.each_with_index do |ans, index|
      question["ans_#{index + 1}"] = ans
    end
  end
end


