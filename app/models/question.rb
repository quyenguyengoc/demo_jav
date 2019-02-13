class Question < ApplicationRecord

  validates :user_answer, presence: true, on: :update

  belongs_to :test
  belongs_to :word
  delegate :content, to: :word, prefix: :word
  delegate :meaning, to: :word, prefix: :word

  def answers
    [answer_1, answer_2, answer_3, answer_4]
  end
end
