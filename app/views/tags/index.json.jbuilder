json.array!(@tags) do |tag|
  json.extract! tag, :id, :type, :title
  json.url tag_url(tag, format: :json)
end
