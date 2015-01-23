# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150123192409) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: true do |t|
    t.integer  "user_id"
    t.integer  "topic_id"
    t.text     "content",    default: ""
    t.integer  "votes_up",   default: 0
    t.integer  "votes_down", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.string   "type"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags_topics", id: false, force: true do |t|
    t.integer "topic_id"
    t.integer "tag_id"
  end

  add_index "tags_topics", ["tag_id"], name: "index_tags_topics_on_tag_id", using: :btree
  add_index "tags_topics", ["topic_id"], name: "index_tags_topics_on_topic_id", using: :btree

  create_table "tags_users", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "tag_id"
  end

  add_index "tags_users", ["tag_id"], name: "index_tags_users_on_tag_id", using: :btree
  add_index "tags_users", ["user_id"], name: "index_tags_users_on_user_id", using: :btree

  create_table "topics", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "first_message_id"
    t.integer  "user_id"
  end

  create_table "user_favourite_topics", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "topic_id"
  end

  add_index "user_favourite_topics", ["topic_id"], name: "index_user_favourite_topics_on_topic_id", using: :btree
  add_index "user_favourite_topics", ["user_id"], name: "index_user_favourite_topics_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username",               default: "", null: false
    t.string   "first_name"
    t.string   "last_name"
    t.text     "about_me"
    t.date     "born_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
