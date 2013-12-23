json.array!(@exams) do |exam|
  json.extract! exam, :id, :name, :type, :diffulty_level
  json.url exam_url(exam, format: :json)
end
