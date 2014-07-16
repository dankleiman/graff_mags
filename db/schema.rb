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

ActiveRecord::Schema.define(version: 20140716022614) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: true do |t|
    t.string "country"
  end

  create_table "crews", force: true do |t|
    t.string "crew"
  end

  create_table "formats", force: true do |t|
    t.string "format"
  end

  create_table "issues", force: true do |t|
    t.string  "title",                     null: false
    t.string  "address"
    t.string  "city"
    t.string  "state"
    t.integer "year"
    t.string  "front_cover"
    t.string  "back_cover"
    t.string  "featured_image"
    t.string  "subtitle"
    t.integer "issue_number"
    t.integer "magazine_id"
    t.integer "language_id"
    t.integer "size_id"
    t.integer "stitching_id"
    t.integer "format_id"
    t.integer "medium_id"
    t.integer "crew_id"
    t.string  "country",        limit: 50
    t.integer "country_id"
  end

  create_table "languages", force: true do |t|
    t.string "language"
  end

  create_table "magazines", force: true do |t|
    t.string "title"
    t.string "alternate_titles"
  end

  create_table "media", force: true do |t|
    t.string "medium"
  end

  create_table "sizes", force: true do |t|
    t.string "size"
  end

  create_table "stitchings", force: true do |t|
    t.string "binding"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                   default: "member", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
