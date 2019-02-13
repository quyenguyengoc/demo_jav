module QuestionHelper

  def user_ans(submited, right_ans, user_ans, current_ans)
    return if !submited || user_ans != current_ans
    if right_ans == user_ans
      'right-ans'
    else
      'wrong-ans'
    end
  end

  def right_ans(submited, right_ans, user_ans, current_ans)
    return unless submited
    'right-ans' if right_ans == current_ans
  end
end
