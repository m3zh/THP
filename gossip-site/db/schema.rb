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

ActiveRecord::Schema.define(version: 2020_05_07_075523) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "gossip_id"
    t.string "content"
    t.string "user"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gossip_id"], name: "index_comments_on_gossip_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "gossips", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tag_id"
    t.string "user"
    t.bigint "user_id"
    t.string "tag"
    t.index ["tag_id"], name: "index_gossips_on_tag_id"
    t.index ["user_id"], name: "index_gossips_on_user_id"
  end

  create_table "private_msgs", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "sender_id"
    t.bigint "recipient_id"
    t.index ["recipient_id"], name: "index_private_msgs_on_recipient_id"
    t.index ["sender_id"], name: "index_private_msgs_on_sender_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gossip"
    t.bigint "gossip_id"
    t.index ["gossip_id"], name: "index_tags_on_gossip_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "description"
    t.string "email"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "city_id"
    t.bigint "gossip_id"
    t.string "city"
    t.string "password_digest"
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["gossip_id"], name: "index_users_on_gossip_id"
  end

  add_foreign_key "comments", "gossips"
  add_foreign_key "comments", "users"
  add_foreign_key "gossips", "tags"
  add_foreign_key "gossips", "users"
  add_foreign_key "tags", "gossips"
  add_foreign_key "users", "cities"
  add_foreign_key "users", "gossips"
end
