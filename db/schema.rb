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

ActiveRecord::Schema[7.2].define(version: 2024_10_06_184352) do
  create_table "bus_routes", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "from_id", null: false
    t.bigint "to_id", null: false
    t.index ["from_id", "to_id"], name: "index_bus_routes_on_from_id_and_to_id", unique: true
    t.index ["from_id"], name: "index_bus_routes_on_from_id"
    t.index ["to_id"], name: "index_bus_routes_on_to_id"
  end

  create_table "bus_time_tables", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "departure_time", null: false
    t.datetime "arrival_time", null: false
    t.bigint "bus_route_id", null: false
    t.index ["bus_route_id"], name: "index_bus_time_tables_on_bus_route_id"
    t.index ["departure_time", "arrival_time", "bus_route_id"], name: "idx_on_departure_time_arrival_time_bus_route_id_db0c6648d6", unique: true
  end

  create_table "destinations", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city", null: false
    t.string "country", null: false
    t.index ["city", "country"], name: "index_destinations_on_city_and_country", unique: true
  end

  add_foreign_key "bus_routes", "destinations", column: "from_id"
  add_foreign_key "bus_routes", "destinations", column: "to_id"
  add_foreign_key "bus_time_tables", "bus_routes"
end
