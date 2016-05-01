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

ActiveRecord::Schema.define(version: 20160430180241) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

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

  create_table "devices", force: :cascade do |t|
    t.string   "device_id"
    t.string   "device_token"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "hotel_charges", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "hotel_id"
    t.integer  "order_type_id"
  end

  add_index "hotel_charges", ["hotel_id"], name: "index_hotel_charges_on_hotel_id"
  add_index "hotel_charges", ["order_type_id"], name: "index_hotel_charges_on_order_type_id"

  create_table "hotel_taxes", force: :cascade do |t|
    t.integer  "hotel_id"
    t.integer  "tax_type_id"
    t.decimal  "amount"
    t.decimal  "percent"
    t.boolean  "active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "hotel_taxes", ["hotel_id"], name: "index_hotel_taxes_on_hotel_id"
  add_index "hotel_taxes", ["tax_type_id"], name: "index_hotel_taxes_on_tax_type_id"

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
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "menu_id"
    t.string   "name"
    t.string   "description"
    t.decimal  "price"
    t.string   "code"
    t.boolean  "active"
  end

  add_index "menu_items", ["menu_id"], name: "index_menu_items_on_menu_id"

  create_table "menus", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "hotel_id"
    t.string   "name"
    t.boolean  "active"
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
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.string   "description"
    t.boolean  "active"
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
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "hotel_id"
    t.integer  "customer_id"
    t.integer  "table_id"
    t.string   "comment"
    t.integer  "status",      default: 0
  end

  add_index "reservations", ["customer_id"], name: "index_reservations_on_customer_id"
  add_index "reservations", ["hotel_id"], name: "index_reservations_on_hotel_id"
  add_index "reservations", ["table_id"], name: "index_reservations_on_table_id"

  create_table "reviews", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "customer_id"
    t.integer  "menu_item_id"
    t.integer  "hotel_id"
    t.string   "title"
    t.string   "review"
    t.decimal  "rating"
  end

  add_index "reviews", ["customer_id"], name: "index_reviews_on_customer_id"
  add_index "reviews", ["hotel_id"], name: "index_reviews_on_hotel_id"
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
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "hotel_id"
    t.boolean  "status",     default: false
  end

  add_index "tables", ["hotel_id"], name: "index_tables_on_hotel_id"

  create_table "tax_types", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "wallets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
