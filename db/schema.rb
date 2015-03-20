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

ActiveRecord::Schema.define(version: 20150320020407) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bonds", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "email_templates", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",       limit: 255
  end

  create_table "interests", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interests_people", force: :cascade do |t|
    t.integer "interest_id"
    t.integer "person_id"
  end

  create_table "marketing_campaigns", force: :cascade do |t|
    t.string   "title",          limit: 255
    t.string   "sms_content",    limit: 255
    t.integer  "people_list_id"
    t.text     "email_content"
    t.string   "type",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sents_count"
  end

  create_table "people", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "email",        limit: 255
    t.string   "phone_number", limit: 255
    t.string   "cell_number",  limit: 255
    t.string   "twitter",      limit: 255
    t.string   "facebook",     limit: 255
    t.string   "instagram",    limit: 255
    t.integer  "bond_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people_lists", force: :cascade do |t|
    t.boolean  "people_by_file"
    t.integer  "sents_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type",           limit: 255
    t.integer  "bond_id"
    t.integer  "interest_id"
  end

  create_table "people_people_lists", force: :cascade do |t|
    t.integer "person_id"
    t.integer "people_list_id"
  end

  create_table "settings", force: :cascade do |t|
    t.string   "label"
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,                         default: "",  null: false
    t.string   "encrypted_password",     limit: 255,                         default: "",  null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                              default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "credits",                            precision: 8, scale: 2, default: 0.0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
