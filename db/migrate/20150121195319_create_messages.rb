class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :topic_id
      t.text :content, default: ''
      t.integer :votes_up, default: 0
      t.integer :votes_down, default: 0

      t.timestamps
    end
  end
end
