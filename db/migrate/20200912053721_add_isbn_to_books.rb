class AddIsbnToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :isbn, :string, unique: true
  end
end
