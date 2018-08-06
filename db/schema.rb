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

ActiveRecord::Schema.define(version: 20180806093532) do

  create_table "job_groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "hour_rate",  default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "job_groups", ["name"], name: "index_job_groups_on_name", unique: true

  create_table "time_reports", force: :cascade do |t|
    t.integer  "report_id"
    t.date     "date"
    t.float    "hours_worked"
    t.integer  "employee_id"
    t.string   "job_group"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
