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

ActiveRecord::Schema.define(version: 20170426171030) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "global_stats", force: :cascade do |t|
    t.string   "date"
    t.integer  "blocks"
    t.integer  "bounce_drops"
    t.integer  "bounces"
    t.integer  "clicks"
    t.integer  "deferred"
    t.integer  "delivered"
    t.integer  "invalid_emails"
    t.integer  "processed"
    t.integer  "requests"
    t.integer  "spam_report_drops"
    t.integer  "spam_reports"
    t.integer  "unique_clicks"
    t.integer  "unique_opens"
    t.integer  "unsubscribe_drops"
    t.integer  "unsubscribes"
    t.bigint   "utc_date"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "providers", force: :cascade do |t|
    t.string   "date"
    t.string   "provider_name"
    t.integer  "blocks"
    t.integer  "bounces"
    t.integer  "clicks"
    t.integer  "deferred"
    t.integer  "delivered"
    t.integer  "drops"
    t.integer  "opens"
    t.integer  "spam_reports"
    t.integer  "unique_clicks"
    t.integer  "unique_opens"
    t.integer  "user_id"
    t.bigint   "utc_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
