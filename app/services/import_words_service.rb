class ImportWordsService
  require 'csv'

  attr_accessor :file

  def initialize(file)
    self.file = file
  end

  def import
    ActiveRecord::Base.transaction do
      csv = CSV.parse(File.read(file.tempfile), headers: true)
      words_by_lesson = []
      term_lesson_number = 1
      total_words = csv.size - 1
      csv.each_with_index do |row, index|
        word = row.to_h
        if term_lesson_number != word['lesson_number'].to_i || index == total_words
          lesson = Lesson.find_or_create_by(number: term_lesson_number)
          lesson.words = words_by_lesson
          words_by_lesson = []
        end
        words_by_lesson << Word.new(word.except('lesson_number').merge(romaji: to_romaji(word['content'])))
        term_lesson_number = word['lesson_number'].to_i
      end
    end
  end

  private

  def to_romaji(text)
    text.romaji
  end
end
