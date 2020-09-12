# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

BOOK_STORE_DATA_PATH = Rails.root.join('data/book_store_data.json')
USER_DATA_PATH = Rails.root.join('data/user_data.json')

DbParser.clear_all_data
DbParser.pour_book_stores_data(BOOK_STORE_DATA_PATH)
DbParser.pour_users_data(USER_DATA_PATH)
