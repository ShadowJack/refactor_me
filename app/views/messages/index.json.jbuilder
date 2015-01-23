json.array!(@messages) do |message|
  json.extract! message, :id, :user_id, :topic_id, :content, :votes_up, :votes_down
  json.url message_url(message, format: :json)
end
