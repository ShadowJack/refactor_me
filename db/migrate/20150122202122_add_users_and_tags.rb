class AddUsersAndTags < ActiveRecord::Migration
  def change
    create_table :tags_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :tag, index: true
    end
  end
end
