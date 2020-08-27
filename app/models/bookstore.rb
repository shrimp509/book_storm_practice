class Bookstore < ApplicationRecord
  has_many :books_in_bookstores
  has_many :books, through: :books_in_bookstores

  has_many :opening_hours
  
  has_many :purchase_histories
  has_many :users, through: :purchase_histories
end
