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

ActiveRecord::Schema.define(version: 20160302192810) do

  create_table "coupons", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "phone"
    t.boolean  "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "wallet_id"
  end

  add_index "customers", ["wallet_id"], name: "index_customers_on_wallet_id"

  create_table "hotel_charges", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "hotel_id"
    t.integer  "order_type_id"
  end

  add_index "hotel_charges", ["hotel_id"], name: "index_hotel_charges_on_hotel_id"
  add_index "hotel_charges", ["order_type_id"], name: "index_hotel_charges_on_order_type_id"

  create_table "hotels", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "address"
    t.string   "phone"
    t.boolean  "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "manager_id"
  end

  add_index "hotels", ["manager_id"], name: "index_hotels_on_manager_id"

  create_table "managers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.boolean  "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "phone"
  end

  create_table "menu_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "menu_id"
  end

  add_index "menu_items", ["menu_id"], name: "index_menu_items_on_menu_id"

  create_table "menus", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "hotel_id"
  end

  add_index "menus", ["hotel_id"], name: "index_menus_on_hotel_id"

  create_table "offers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "hotel_id"
  end

  add_index "offers", ["hotel_id"], name: "index_offers_on_hotel_id"

  create_table "order_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "order_id"
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id"

  create_table "order_types", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "hotel_id"
    t.integer  "order_type_id"
    t.integer  "customer_id"
    t.integer  "coupon_id"
  end

  add_index "orders", ["coupon_id"], name: "index_orders_on_coupon_id"
  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id"
  add_index "orders", ["hotel_id"], name: "index_orders_on_hotel_id"
  add_index "orders", ["order_type_id"], name: "index_orders_on_order_type_id"

  create_table "reservations", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "hotel_id"
    t.integer  "customer_id"
    t.integer  "table_id"
  end

  add_index "reservations", ["customer_id"], name: "index_reservations_on_customer_id"
  add_index "reservations", ["hotel_id"], name: "index_reservations_on_hotel_id"
  add_index "reservations", ["table_id"], name: "index_reservations_on_table_id"

  create_table "reviews", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "customer_id"
    t.integer  "menu_item_id"
  end

  add_index "reviews", ["customer_id"], name: "index_reviews_on_customer_id"
  add_index "reviews", ["menu_item_id"], name: "index_reviews_on_menu_item_id"

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id"
    t.boolean  "logout"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "login_id"
    t.string   "login_type"
  end

  add_index "sessions", ["login_type", "login_id"], name: "index_sessions_on_login_type_and_login_id"

  create_table "tables", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "hotel_id"
  end

  add_index "tables", ["hotel_id"], name: "index_tables_on_hotel_id"

  create_table "wallets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
