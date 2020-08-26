class CreatePurchaseHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_histories do |t|
      t.references :bookstore, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.float :transaction_amount
      t.datetime :transaction_date

      t.timestamps
    end
  end
end
