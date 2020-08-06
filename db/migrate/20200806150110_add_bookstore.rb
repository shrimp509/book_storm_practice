class AddBookstore < ActiveRecord::Migration[6.0]
  def change
    create_table :bookstore do |t|
      t.integer :cash_balance
      t.references :books
      t.timestamp :opening_hours
      t.string :store_name
    end
  end
end
