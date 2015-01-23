json.array!(@topics) do |topic|
  json.extract! topic, :id, :title, :first_comment
  json.url topic_url(topic, format: :json)
end
