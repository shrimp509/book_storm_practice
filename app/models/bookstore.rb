class Bookstore < ApplicationRecord
  has_many :purchase_histories
  has_many :opening_hours
end
