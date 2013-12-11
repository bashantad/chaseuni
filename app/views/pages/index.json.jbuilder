json.array!(@pages) do |page|
  json.extract! page, :id, :title, :description
  json.url page_url(page, format: :json)
end
