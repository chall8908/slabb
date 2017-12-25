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

ActiveRecord::Schema.define(version: 20171225023905) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audits", force: :cascade do |t|
    t.integer "item_id"
    t.string "type"
    t.string "event"
    t.json "changes"
    t.integer "user_id"
    t.json "attributed_to"
    t.string "comment"
    t.datetime "recorded_at"
    t.index ["recorded_at"], name: "index_audits_on_recorded_at"
    t.index ["type", "item_id"], name: "item_index"
    t.index ["user_id"], name: "user_index"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "sender_id"
    t.bigint "recipient_id"
    t.text "title"
    t.text "body"
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["parent_id"], name: "index_messages_on_reply_to_id"
    t.index ["recipient_id"], name: "index_messages_on_recipient_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "creator_id"
    t.text "title"
    t.text "body"
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["creator_id"], name: "index_posts_on_creator_id"
    t.index ["parent_id"], name: "index_posts_on_reply_to_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "locked_at"
    t.integer "locked_for"
    t.string "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.datetime "deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "messages", "messages", column: "parent_id"
  add_foreign_key "messages", "users", column: "recipient_id"
  add_foreign_key "messages", "users", column: "sender_id"
  add_foreign_key "posts", "posts", column: "parent_id"
  add_foreign_key "posts", "users", column: "creator_id"
end
