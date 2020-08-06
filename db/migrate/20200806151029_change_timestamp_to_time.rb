class ChangeTimestampToTime < ActiveRecord::Migration[6.0]
  def change
    change_column :bookstore, :opening_hours, :time
  end
end
