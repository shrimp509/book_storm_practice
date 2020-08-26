class PurchaseHistory < ApplicationRecord
  belongs_to :bookstore
  belongs_to :book
  belongs_to :user
end
