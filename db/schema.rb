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

ActiveRecord::Schema.define(version: 2021_09_24_140815) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airlines", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flights", force: :cascade do |t|
    t.integer "number"
    t.string "date"
    t.string "departure_city"
    t.string "arrival_city"
    t.bigint "airline_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["airline_id"], name: "index_flights_on_airline_id"
  end

  create_table "manifest_entries", force: :cascade do |t|
    t.bigint "flight_id"
    t.bigint "passenger_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flight_id"], name: "index_manifest_entries_on_flight_id"
    t.index ["passenger_id"], name: "index_manifest_entries_on_passenger_id"
  end

  create_table "passengers", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "flights", "airlines"
  add_foreign_key "manifest_entries", "flights"
  add_foreign_key "manifest_entries", "passengers"
end
