class Book < ApplicationRecord
  has_many :books_in_bookstores
  has_many :bookstores, through: :books_in_bookstores

  has_many :purchase_histories
  has_many :users, through: :purchase_histories
end
