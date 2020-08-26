class Bookstore < ApplicationRecord
  has_many :purchase_histories

  has_many :opening_hours

  has_many :books_in_bookstores
  has_many :books, through: :books_in_bookstores
end
