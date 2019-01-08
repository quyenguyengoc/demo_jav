ActiveAdmin.register Lesson do
  config.filters = false
  permit_params :number

  index do
    id_column
    column { |lesson| lesson_name(lesson.number) }
  end

  form do |f|
    f.inputs do
      f.input :number, as: :number
    end
    f.actions
  end

end
