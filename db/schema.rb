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

ActiveRecord::Schema.define(version: 20151019211314) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.boolean  "reminder"
    t.string   "reason"
    t.integer  "doctor_id"
    t.integer  "customer_id"
    t.integer  "pet_id"
    t.datetime "appointment_date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "appointments", ["customer_id"], name: "index_appointments_on_customer_id", using: :btree
  add_index "appointments", ["doctor_id"], name: "index_appointments_on_doctor_id", using: :btree
  add_index "appointments", ["pet_id"], name: "index_appointments_on_pet_id", using: :btree

  create_table "pets", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.string   "breed"
    t.integer  "y_age"
    t.integer  "m_age"
    t.integer  "weight"
    t.datetime "last_visit"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pets", ["user_id"], name: "index_pets_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "name",                                   null: false
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.boolean  "admin",                  default: false, null: false
    t.string   "role_type"
    t.string   "school"
    t.integer  "years"
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
