class AddTopicAndTag < ActiveRecord::Migration
  def change
    create_table :tags_topics, id: false do |t|
      t.belongs_to :topic, index: true
      t.belongs_to :tag, index: true
    end
  end
end
