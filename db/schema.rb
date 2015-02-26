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

ActiveRecord::Schema.define(version: 20150226155553) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.integer  "member_id"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["member_id"], name: "index_accounts_on_member_id", using: :btree
  add_index "accounts", ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true, using: :btree

  create_table "events", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "instance_id"
    t.string   "instance_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "events", ["group_id"], name: "index_events_on_group_id", using: :btree
  add_index "events", ["instance_type", "instance_id"], name: "index_events_on_instance_type_and_instance_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.date     "anniversary"
  end

  create_table "medallions", force: :cascade do |t|
    t.integer  "meeting_id"
    t.integer  "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "medallions", ["meeting_id"], name: "index_medallions_on_meeting_id", using: :btree
  add_index "medallions", ["member_id"], name: "index_medallions_on_member_id", using: :btree

  create_table "meetings", force: :cascade do |t|
    t.integer  "group_id"
    t.string   "name"
    t.string   "facility"
    t.string   "street"
    t.string   "city"
    t.integer  "weekday"
    t.time     "time"
    t.integer  "category"
    t.integer  "format"
    t.boolean  "accessible"
    t.text     "notice"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "frequency",  default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "meetings", ["group_id"], name: "index_meetings_on_group_id", using: :btree

  create_table "member_emails", force: :cascade do |t|
    t.integer  "member_id"
    t.string   "email"
    t.boolean  "is_primary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "member_emails", ["member_id"], name: "index_member_emails_on_member_id", using: :btree

  create_table "members", force: :cascade do |t|
    t.integer  "group_id"
    t.string   "first_name"
    t.string   "last_initial"
    t.string   "phone"
    t.date     "birthday"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "members", ["group_id"], name: "index_members_on_group_id", using: :btree

  create_table "members_roles", id: false, force: :cascade do |t|
    t.integer "member_id"
    t.integer "role_id"
  end

  add_index "members_roles", ["member_id", "role_id"], name: "index_members_roles_on_member_id_and_role_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  add_foreign_key "events", "groups"
  add_foreign_key "medallions", "meetings"
  add_foreign_key "medallions", "members"
end
