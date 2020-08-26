class User < ApplicationRecord
  has_many :purchase_histories
  has_many :books, through: :purchase_histories
end
