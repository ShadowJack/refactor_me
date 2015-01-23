class AddFirstMessageToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :first_message_id, :integer
  end
end
