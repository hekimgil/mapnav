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

ActiveRecord::Schema.define(version: 20141115152623) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: true do |t|
#    t.integer  "eventId"
    t.integer  "user_id"
    t.datetime "createdDate"
    t.string   "title"
    t.text     "description"
    t.string   "thumbnail"
    t.decimal  "latitude",	:precision => 10, :scale => 7
    t.decimal  "longitude",	:precision => 10, :scale => 7
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.string   "url"
    t.string   "thumbnail"
    t.string   "bitmap"
    t.string   "title"
    t.text     "description"
    t.decimal  "latitude",	:precision => 10, :scale => 7
    t.decimal  "longitude",	:precision => 10, :scale => 7
    t.integer  "event_id"
    t.datetime "createdDate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_index "photos", ["event_id"], name: "index_photos_on_event_id", unique: false, using: :btree

  add_index "events", ["user_id"], name: "index_events_on_user_id", unique: false, using: :btree

end
