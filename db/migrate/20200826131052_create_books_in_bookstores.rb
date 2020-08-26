class CreateBooksInBookstores < ActiveRecord::Migration[6.0]
  def change
    create_table :books_in_bookstores do |t|
      t.references :bookstore, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.float :price

      t.timestamps
    end
  end
end
