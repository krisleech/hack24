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

ActiveRecord::Schema.define(version: 20150502152320) do

  create_table "films", force: :cascade do |t|
    t.string   "title",             limit: 255
    t.string   "release_year",      limit: 255
    t.integer  "duration",          limit: 4
    t.string   "director",          limit: 255
    t.string   "certificate",       limit: 255
    t.string   "genres",            limit: 255
    t.string   "country_of_origin", limit: 255
    t.string   "writer",            limit: 255
    t.string   "actors",            limit: 255
    t.string   "poster",            limit: 255
    t.string   "metascore",         limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "screenings", force: :cascade do |t|
    t.time     "screening_time"
    t.date     "screening_date"
    t.integer  "duration",          limit: 4
    t.string   "title",             limit: 255
    t.string   "director",          limit: 255
    t.string   "certificate",       limit: 255
    t.string   "genres",            limit: 255
    t.string   "country_of_origin", limit: 255
    t.integer  "total_admissions",  limit: 4
    t.integer  "capacity",          limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "sms", force: :cascade do |t|
    t.string   "message",    limit: 255
    t.string   "number",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "direction",  limit: 255
  end

end
