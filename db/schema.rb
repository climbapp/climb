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

ActiveRecord::Schema.define(version: 20140601214924) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bills", force: true do |t|
    t.string   "name"
    t.boolean  "paid?"
    t.float    "amount_due"
    t.datetime "due_date"
    t.float    "late_fee"
    t.float    "interest"
    t.float    "min_due"
    t.integer  "payee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bills", ["payee_id"], name: "index_bills_on_payee_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payees", force: true do |t|
    t.string   "name"
    t.string   "recurring"
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payees", ["category_id"], name: "index_payees_on_category_id", using: :btree
  add_index "payees", ["user_id"], name: "index_payees_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.boolean  "sms_remind?"
    t.boolean  "email_remind?"
    t.integer  "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
