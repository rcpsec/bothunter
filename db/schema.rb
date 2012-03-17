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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120317134911) do

  create_table "groups", :force => true do |t|
    t.string "link"
    t.string "name"
    t.string "gid"
    t.string "domain"
    t.string "title"
  end

  create_table "groups_users", :force => true do |t|
    t.integer "user_id"
    t.integer "group_id"
  end

  create_table "oauth_tokens", :force => true do |t|
    t.integer "user_id"
    t.string  "token"
    t.string  "provider"
    t.string  "domain"
  end

  create_table "people", :force => true do |t|
    t.datetime "bdate"
    t.string   "uid"
    t.string   "domain"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "state"
    t.string   "photo"
    t.integer  "friends_count"
  end

  create_table "promocodes", :force => true do |t|
    t.integer "user_id"
    t.integer "groups_limit"
    t.integer "people_limit"
    t.string  "code"
  end

  add_index "promocodes", ["code"], :name => "index_promocodes_on_code"

  create_table "users", :force => true do |t|
    t.boolean  "approved"
    t.string   "full_name"
    t.string   "phone_number"
    t.string   "company"
    t.string   "message"
    t.integer  "objects_amount",         :default => 0
    t.integer  "people_limit",           :default => 100
    t.string   "email",                  :default => "",  :null => false
    t.string   "encrypted_password",     :default => "",  :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
