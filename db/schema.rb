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

ActiveRecord::Schema.define(version: 20160426031340) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "accounts", force: :cascade do |t|
    t.string   "provider",    limit: 24,              null: false
    t.string   "uid",                                 null: false
    t.string   "name",                                null: false
    t.string   "email"
    t.string   "nickname"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "location"
    t.string   "description"
    t.string   "image"
    t.string   "phone",       limit: 24
    t.hstore   "urls",                   default: {}
    t.string   "token"
    t.string   "secret"
    t.string   "expires"
    t.datetime "expires_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "user_id"
  end

  add_index "accounts", ["provider"], name: "index_accounts_on_provider", using: :btree
  add_index "accounts", ["uid"], name: "index_accounts_on_uid", using: :btree
  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id", using: :btree

  create_table "channels", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "channels", ["name"], name: "index_channels_on_name", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "text"
    t.integer  "channel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "posts", ["channel_id"], name: "index_posts_on_channel_id", using: :btree

  create_table "schedules", force: :cascade do |t|
    t.text     "recurrence"
    t.integer  "channel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "schedules", ["channel_id"], name: "index_schedules_on_channel_id", using: :btree

  create_table "slots", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "schedulable_id"
    t.string   "schedulable_type"
    t.datetime "publish_at"
    t.datetime "published_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "slots", ["post_id"], name: "index_slots_on_post_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "nickname"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "posts", "channels"
  add_foreign_key "schedules", "channels"
  add_foreign_key "slots", "posts"
end
