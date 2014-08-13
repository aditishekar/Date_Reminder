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

ActiveRecord::Schema.define(version: 20140801211151) do

  create_table "emails", force: true do |t|
    t.string   "email"
    t.binary   "opt_in"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sms"
  end

  create_table "reminders", force: true do |t|
    t.date     "date"
    t.text     "message"
    t.binary   "frequency_day"
    t.binary   "frequency_week"
    t.binary   "frequency_twoweek"
    t.binary   "frequency_month"
    t.binary   "method_text"
    t.binary   "method_email"
    t.integer  "email_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "date_type"
  end

end
