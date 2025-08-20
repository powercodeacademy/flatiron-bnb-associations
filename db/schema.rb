# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_08_19_142907) do
  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "listings", force: :cascade do |t|
    t.string "address"
    t.string "listing_type"
    t.string "title"
    t.text "description"
    t.decimal "price"
    t.integer "neighborhood_id"
    t.integer "host_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["host_id"], name: "index_listings_on_host_id"
    t.index ["neighborhood_id"], name: "index_listings_on_neighborhood_id"
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.string "name"
    t.integer "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_neighborhoods_on_city_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.date "checkin"
    t.date "checkout"
    t.integer "listing_id", null: false
    t.integer "guest_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guest_id"], name: "index_reservations_on_guest_id"
    t.index ["listing_id"], name: "index_reservations_on_listing_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "description"
    t.integer "rating"
    t.integer "guest_id"
    t.integer "reservation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guest_id"], name: "index_reviews_on_guest_id"
    t.index ["reservation_id"], name: "index_reviews_on_reservation_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "listings", "neighborhoods"
  add_foreign_key "listings", "users", column: "host_id"
  add_foreign_key "neighborhoods", "cities"
  add_foreign_key "reservations", "listings"
  add_foreign_key "reservations", "users", column: "guest_id"
  add_foreign_key "reviews", "users", column: "guest_id"
end
