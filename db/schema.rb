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

ActiveRecord::Schema.define(version: 20150426213950) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "generals", force: true do |t|
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "last_login"
    t.string   "password_digest"
  end

  create_table "logs", force: true do |t|
    t.string   "description"
    t.integer  "log_class"
    t.text     "log_objects"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "repositories", force: true do |t|
    t.string   "name"
    t.string   "source"
    t.string   "description"
    t.boolean  "desc_raw"
    t.string   "author"
    t.integer  "interval"
    t.datetime "end_date"
    t.string   "tags"
    t.integer  "answer_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "vat"
  end

  create_table "responses", force: true do |t|
    t.string   "list"
    t.integer  "quest_id"
    t.string   "author"
    t.integer  "confidence"
    t.string   "session_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "valdatime"
    t.string   "vat"
    t.string   "request_ip"
    t.string   "request_header"
    t.string   "value"
    t.text     "comment"
    t.text     "context"
  end

end
