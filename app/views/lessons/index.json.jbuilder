json.array!(@lessons) do |lesson|
  json.extract! lesson, :id
  json.url course_lesson_url(@course, lesson, format: :json)
end
