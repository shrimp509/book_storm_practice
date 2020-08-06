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

ActiveRecord::Schema.define(version: 2020_08_06_150714) do

  create_table "book", force: :cascade do |t|
    t.string "book_name"
    t.integer "price"
  end

  create_table "bookstore", force: :cascade do |t|
    t.integer "cash_balance"
    t.integer "books_id"
    t.datetime "opening_hours"
    t.string "store_name"
    t.index ["books_id"], name: "index_bookstore_on_books_id"
  end

end
