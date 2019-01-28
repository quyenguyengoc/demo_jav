class TestsController < ApplicationController

  def show
  end

  def new
    set_lessons
    set_number_question_option
    @test = Test.new
  end

  def create
    test = Test.new(
      total_questions: test_params[:total_questions].to_i,
      user_id: User.first.id
    )
    # redirect_to test if test.save
    TestGenerateService.new(test_params, test)
    binding.pry
  end

  private

  def set_lessons
    @lessons = Lesson.all
  end

  def set_number_question_option
    @number_question_option = (1..@lessons.size).map do |i|
      i*30
    end
  end

  def test_params
    params.require(:test).permit(:high_priority, :total_questions, lesson_numbers: [])
  end
end
