json.array!(@questions) do |question|
  json.extract! question, :id, :title, :description, :user_id, :course_id, :is_multiple_choice
  json.url question_url(question, format: :json)
end
