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

ActiveRecord::Schema[7.0].define(version: 2024_04_30_235845) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_balances", force: :cascade do |t|
    t.decimal "balance", precision: 10, scale: 2, default: "0.0"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_account_balances_on_user_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.integer "zipcode"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "bids", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.bigint "zord_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "base_price"
    t.index ["zord_id"], name: "index_bids_on_zord_id"
  end

  create_table "cart_items", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.bigint "zord_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["zord_id"], name: "index_cart_items_on_zord_id"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "subject"
    t.string "message"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "request_id"
    t.bigint "zord_id"
    t.index ["request_id"], name: "index_notifications_on_request_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
    t.index ["zord_id"], name: "index_notifications_on_zord_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "zord_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["zord_id"], name: "index_order_items_on_zord_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "status"
    t.bigint "address_id", null: false
    t.bigint "user_id", null: false
    t.bigint "payment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_orders_on_address_id"
    t.index ["payment_id"], name: "index_orders_on_payment_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "card_type"
    t.integer "card_number"
    t.date "expiry_date"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.string "description"
    t.string "status"
    t.string "theme"
    t.string "material"
    t.integer "capacity"
    t.string "ability"
    t.integer "price"
    t.string "messsage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "resales", force: :cascade do |t|
    t.bigint "zord_id", null: false
    t.bigint "user_id", null: false
    t.decimal "new_price"
    t.string "condition"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_resales_on_user_id"
    t.index ["zord_id"], name: "index_resales_on_zord_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "review_message"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_item_id"
    t.bigint "user_id"
    t.bigint "zord_id"
    t.index ["order_item_id"], name: "index_reviews_on_order_item_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
    t.index ["zord_id"], name: "index_reviews_on_zord_id"
  end

  create_table "user_registrations", force: :cascade do |t|
    t.bigint "bid_id", null: false
    t.bigint "user_id", null: false
    t.integer "bid_value", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bid_id"], name: "index_user_registrations_on_bid_id"
    t.index ["user_id"], name: "index_user_registrations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "vendor", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "zords", force: :cascade do |t|
    t.string "name"
    t.string "theme"
    t.string "material"
    t.integer "capacity"
    t.string "ability"
    t.decimal "price"
    t.text "description"
    t.integer "quantity"
    t.decimal "avg_rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "limited", default: false
    t.boolean "used"
  end

  add_foreign_key "account_balances", "users"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "users"
  add_foreign_key "bids", "zords"
  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "zords"
  add_foreign_key "carts", "users"
  add_foreign_key "notifications", "requests"
  add_foreign_key "notifications", "users"
  add_foreign_key "notifications", "zords"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "zords"
  add_foreign_key "orders", "addresses"
  add_foreign_key "orders", "payments"
  add_foreign_key "orders", "users"
  add_foreign_key "payments", "users"
  add_foreign_key "requests", "users"
  add_foreign_key "resales", "users"
  add_foreign_key "resales", "zords"
  add_foreign_key "reviews", "order_items"
  add_foreign_key "reviews", "users"
  add_foreign_key "reviews", "zords"
  add_foreign_key "user_registrations", "bids"
  add_foreign_key "user_registrations", "users"
end
