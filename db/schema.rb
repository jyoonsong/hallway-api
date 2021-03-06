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

ActiveRecord::Schema.define(version: 2020_05_16_025735) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "logs", force: :cascade do |t|
    t.string "kind"
    t.string "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_logs_on_user_id"
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "match_one_id", null: false
    t.bigint "match_two_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_one_id"], name: "index_matches_on_match_one_id"
    t.index ["match_two_id"], name: "index_matches_on_match_two_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "affiliation"
    t.string "link"
    t.string "image"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "waits", force: :cascade do |t|
    t.bigint "waiting_id", null: false
    t.bigint "waiter_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["waiter_id"], name: "index_waits_on_waiter_id"
    t.index ["waiting_id"], name: "index_waits_on_waiting_id"
  end

  add_foreign_key "logs", "users"
  add_foreign_key "matches", "users", column: "match_one_id"
  add_foreign_key "matches", "users", column: "match_two_id"
  add_foreign_key "waits", "users", column: "waiter_id"
  add_foreign_key "waits", "users", column: "waiting_id"
end
