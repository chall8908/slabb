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

ActiveRecord::Schema.define(version: 20171216014338) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: :cascade do |t|
    t.bigint "sender_id"
    t.bigint "recipient_id"
    t.text "title"
    t.text "body"
    t.bigint "reply_to_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id"], name: "index_messages_on_recipient_id"
    t.index ["reply_to_id"], name: "index_messages_on_reply_to_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "creator_id"
    t.text "title"
    t.text "body"
    t.bigint "reply_to_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_posts_on_creator_id"
    t.index ["reply_to_id"], name: "index_posts_on_reply_to_id"
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
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "messages", "messages", column: "reply_to_id"
  add_foreign_key "messages", "users", column: "recipient_id"
  add_foreign_key "messages", "users", column: "sender_id"
  add_foreign_key "posts", "posts", column: "reply_to_id"
  add_foreign_key "posts", "users", column: "creator_id"
end
