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

ActiveRecord::Schema.define(:version => 20140521212127) do

  create_table "bookings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "hotel_id"
    t.integer  "room_id"
    t.date     "chkin"
    t.date     "chkout"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "hotel_id"
    t.integer  "room_id"
    t.string   "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "hotels", :force => true do |t|
    t.string "country"
    t.string "city"
    t.string "region"
    t.string "name"
    t.string "address"
    t.string "phone"
  end

  create_table "rooms", :force => true do |t|
    t.integer "hotel_id"
    t.integer "room_price"
    t.string  "img"
    t.boolean "reserved",   :default => false
  end

  add_index "rooms", ["hotel_id"], :name => "hotel_id"

  create_table "users", :force => true do |t|
    t.string  "name"
    t.string  "email"
    t.string  "password"
    t.string  "phone"
    t.boolean "admin",    :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
