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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110212063503) do

  create_table "resources", :force => true do |t|
    t.string   "name"
    t.text     "excerpt"
    t.string   "url"
    t.integer  "contributor_id"
    t.integer  "topic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "level"
    t.float    "average_rating"
  end

  add_index "resources", ["topic_id", "average_rating"], :name => "index_resources_on_topic_id_and_average_rating"
  add_index "resources", ["topic_id", "level"], :name => "index_resources_on_topic_id_and_level"
  add_index "resources", ["topic_id"], :name => "index_resources_on_topic_id"
  add_index "resources", ["url"], :name => "index_resources_on_url", :unique => true

  create_table "reviews", :force => true do |t|
    t.integer  "reviewer_id"
    t.integer  "resource_id"
    t.integer  "rating"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["resource_id", "created_at"], :name => "index_reviews_on_resource_id_and_created_at"
  add_index "reviews", ["resource_id", "rating"], :name => "index_reviews_on_resource_id_and_rating"
  add_index "reviews", ["resource_id"], :name => "index_reviews_on_resource_id"

  create_table "topics", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "enabled"
    t.integer  "resources_count", :default => 0
    t.string   "permalink"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.string   "display_name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
