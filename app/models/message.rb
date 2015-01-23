class Message < ActiveRecord::Base
  belongs_to :topic, class_name: 'Topic', foreign_key: :topic_id, touch: true
  belongs_to :user, class_name: 'User', foreign_key: :user_id
end
