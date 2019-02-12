class TestsController < ApplicationController
  before_action :set_test, only: [:show, :update]

  def show
    @test = Test.find_by(id: params[:id])
    return redirect_to root_path unless @test
    @questions = @test.questions.includes(:word)
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
    ActiveRecord::Base.transaction do
      if test.save
        test.create_questions(test_params)
        redirect_to test
      end
    end
  end

  def update
    return redirect_to @test if @test.status
    @test.assign_attributes(submit_test_params)
    if @test.save && @test.update_correct_question_count
      redirect_to @test
    end
  end

  private

  def set_test
    @test = Test.find_by(id: params[:id])
    return redirect_to root_path unless @test
  end

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

  def submit_test_params
    params.require(:test).permit(questions_attributes: [:id, :user_answer]).merge(status: 1)
  end
end
