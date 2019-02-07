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

ActiveRecord::Schema.define(version: 2019_02_07_205602) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "zip_code"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id"
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.text "content"
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "gossips", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.string "content"
    t.index ["user_id"], name: "index_gossips_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "comment_id"
    t.bigint "gossip_id"
    t.bigint "user_id"
    t.index ["comment_id"], name: "index_likes_on_comment_id"
    t.index ["gossip_id"], name: "index_likes_on_gossip_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "multi_pms", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "private_message_id"
    t.index ["private_message_id"], name: "index_multi_pms_on_private_message_id"
    t.index ["user_id"], name: "index_multi_pms_on_user_id"
  end

  create_table "private_messages", force: :cascade do |t|
    t.text "content"
    t.bigint "sender_id"
    t.index ["sender_id"], name: "index_private_messages_on_sender_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "title"
  end

  create_table "tags_by_potins", force: :cascade do |t|
    t.bigint "gossip_id"
    t.bigint "tag_id"
    t.index ["gossip_id"], name: "index_tags_by_potins_on_gossip_id"
    t.index ["tag_id"], name: "index_tags_by_potins_on_tag_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "city_id"
    t.string "first_name"
    t.string "last_name"
    t.text "description"
    t.string "email"
    t.integer "age"
    t.string "password_digest"
    t.index ["city_id"], name: "index_users_on_city_id"
  end

  add_foreign_key "comments", "users"
  add_foreign_key "multi_pms", "users"
  add_foreign_key "tags_by_potins", "gossips"
  add_foreign_key "tags_by_potins", "tags"
  add_foreign_key "users", "cities"
end
