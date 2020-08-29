class CreateBookstores < ActiveRecord::Migration[6.0]
  def change
    create_table :bookstores do |t|
      t.string :name
      t.float :cash_balance

      t.timestamps
    end
  end
end
