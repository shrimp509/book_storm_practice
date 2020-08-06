class AddBook < ActiveRecord::Migration[6.0]
  def change
    create_table :book do |t|
      t.string :book_name
      t.integer :price
    end
  end
end
