ActiveAdmin.register Word do
  config.filters = false
  permit_params :content, :meaning, :kanji, :romaji, :lesson_id

  index do
    id_column
    column :content
    column :meaning
    column :kanji
    column :romaji
    column :lesson do |word|
      lesson_name(word.lesson_number)
    end
    column :correct_rate
    actions
  end

  form do |f|
    f.inputs do
      f.input :content
      f.input :meaning
      f.input :kanji
      f.input :romaji
      f.input :lesson_id, as: :select, collection: Lesson.all.map { | lesson| [lesson.id, lesson.number] }, include_blank: false
    end
    f.actions
  end

  action_item(:index) do
    render 'import_form'
  end

  controller do

    def import
      ImportWordsService.new(params[:word][:file]).import
      redirect_to admin_words_path
    end
  end


end
