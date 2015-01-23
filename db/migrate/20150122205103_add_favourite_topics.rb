class AddFavouriteTopics < ActiveRecord::Migration
  def change
    create_table :user_favourite_topics, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :topic, index: true
    end
  end
end
