# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_12_053721) do

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "isbn"
  end

  create_table "books_in_bookstores", force: :cascade do |t|
    t.integer "bookstore_id", null: false
    t.integer "book_id", null: false
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_books_in_bookstores_on_book_id"
    t.index ["bookstore_id"], name: "index_books_in_bookstores_on_bookstore_id"
  end

  create_table "bookstores", force: :cascade do |t|
    t.string "name"
    t.float "cash_balance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "opening_hours", force: :cascade do |t|
    t.integer "bookstore_id", null: false
    t.datetime "open_at"
    t.datetime "close_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bookstore_id"], name: "index_opening_hours_on_bookstore_id"
  end

  create_table "purchase_histories", force: :cascade do |t|
    t.integer "bookstore_id", null: false
    t.integer "book_id", null: false
    t.integer "user_id", null: false
    t.float "transaction_amount"
    t.datetime "transaction_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_purchase_histories_on_book_id"
    t.index ["bookstore_id"], name: "index_purchase_histories_on_bookstore_id"
    t.index ["user_id"], name: "index_purchase_histories_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.float "cash_balance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "books_in_bookstores", "books"
  add_foreign_key "books_in_bookstores", "bookstores"
  add_foreign_key "opening_hours", "bookstores"
  add_foreign_key "purchase_histories", "books"
  add_foreign_key "purchase_histories", "bookstores"
  add_foreign_key "purchase_histories", "users"
end
