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

ActiveRecord::Schema.define(:version => 20120518140454) do

  create_table "messages", :force => true do |t|
    t.integer  "session_id"
    t.integer  "owner_id"
    t.datetime "timestamp"
    t.integer  "receiver_id"
    t.text     "text"
    t.string   "media"
    t.integer  "location_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "positions", :force => true do |t|
    t.integer  "user_id"
    t.decimal  "lat"
    t.decimal  "long"
    t.decimal  "altitude"
    t.decimal  "accuracy"
    t.decimal  "altitude_accuracy"
    t.datetime "timestamp"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "sessions", :force => true do |t|
    t.integer  "owner_id"
    t.integer  "timeout"
    t.integer  "forwarding_time"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.boolean  "admin",           :default => false
  end

end
