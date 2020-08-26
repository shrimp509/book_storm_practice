class CreateOpeningHours < ActiveRecord::Migration[6.0]
  def change
    create_table :opening_hours do |t|
      t.references :bookstore, null: false, foreign_key: true
      t.datetime :open_at
      t.datetime :close_at

      t.timestamps
    end
  end
end
