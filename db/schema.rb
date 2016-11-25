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

ActiveRecord::Schema.define(version: 20161124213744) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "establishment"
    t.string   "city"
    t.string   "address"
    t.float    "lon"
    t.float    "lat"
    t.integer  "index"
    t.integer  "trip_id"
    t.integer  "trip_day_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "main_category_id"
    t.index ["main_category_id"], name: "index_activities_on_main_category_id", using: :btree
    t.index ["trip_day_id"], name: "index_activities_on_trip_day_id", using: :btree
    t.index ["trip_id"], name: "index_activities_on_trip_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.string   "google_title"
    t.integer  "main_category_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["main_category_id"], name: "index_categories_on_main_category_id", using: :btree
  end

  create_table "main_categories", force: :cascade do |t|
    t.string   "title"
    t.string   "icon"
    t.string   "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trip_days", force: :cascade do |t|
    t.string   "title"
    t.date     "date"
    t.integer  "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_trip_days_on_trip_id", using: :btree
  end

  create_table "trips", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "category"
    t.string   "city"
    t.string   "country"
    t.float    "lat"
    t.float    "lon"
    t.string   "photo"
    t.boolean  "public",      default: true
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["user_id"], name: "index_trips_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
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
    t.string   "username"
    t.string   "mobile"
    t.string   "photo"
    t.string   "hometown"
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "token"
    t.datetime "token_expiry"
    t.boolean  "admin",                  default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "activities", "main_categories"
  add_foreign_key "activities", "trip_days"
  add_foreign_key "activities", "trips"
  add_foreign_key "categories", "main_categories"
  add_foreign_key "trip_days", "trips"
  add_foreign_key "trips", "users"
end
