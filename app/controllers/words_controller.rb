class WordsController < ApplicationController

  def index
    lessons = params[:lessons]
    total_words = Word._count_by_lesson(lessons).values.sum
    step = (total_words.to_f / 7).ceil
    word_options = (10..total_words-10).step(step).map do |words|
      words
    end
    word_options << total_words
    render json: word_options
  end
end
