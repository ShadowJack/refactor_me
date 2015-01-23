class Topic < ActiveRecord::Base
  has_many :messages, class_name: 'Message', dependent: :destroy
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :liked_users, class_name: 'User', association_foreign_key: :user_id, join_table: :topics_users
end
