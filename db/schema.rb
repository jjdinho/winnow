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

ActiveRecord::Schema.define(version: 2019_01_19_225216) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "news_feeds", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "frequency"
    t.string "keyword"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.string "domains"
    t.integer "language", default: 2
    t.integer "sortby", default: 1
    t.boolean "strict", default: true
    t.index ["user_id"], name: "index_news_feeds_on_user_id"
  end

  create_table "news_feeds_sources", id: false, force: :cascade do |t|
    t.bigint "news_feed_id", null: false
    t.bigint "news_source_id", null: false
    t.index ["news_feed_id", "news_source_id"], name: "index_news_feeds_sources_on_news_feed_id_and_news_source_id"
  end

  create_table "news_sources", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "id_tag"
  end

  create_table "security_hexes", force: :cascade do |t|
    t.string "hex"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "news_feeds", "users"
end
