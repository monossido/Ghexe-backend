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

ActiveRecord::Schema.define(version: 20141213151017) do

  create_table "events", force: true do |t|
    t.string   "title"
    t.time     "time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "dayofweek"
  end

  create_table "presences", force: true do |t|
    t.boolean  "presence"
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "presences", ["event_id"], name: "index_presences_on_event_id"
  add_index "presences", ["user_id"], name: "index_presences_on_user_id"

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "second_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password"
  end

end
