json.array!(@courses) do |course|
  json.extract! course, :id, :title, :description, :level, :faculty_id, :user_id
  json.url course_url(course, format: :json)
end
