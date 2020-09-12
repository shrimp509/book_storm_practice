require 'json'
require 'date'

class DbParser

  def self.clear_all_data
    puts 'not yet implemented'
  end

  def self.pour_users_data user_data_file_path
    load_data_as_json(user_data_file_path).map do |user|
      puts "id: #{user['id']}, name: #{user['name']}, cashBalance: #{user['cashBalance']}, purchaseHistory: #{user['purchaseHistory']}"
    end
  end

  def self.pour_book_stores_data book_store_data_file_path
    load_data_as_json(book_store_data_file_path).map do |bookstore|
      # puts bookstore['storeName']
      # puts bookstore['cashBalance']
      # parse_opening_hours_into_datetime(bookstore['openingHours'])
      # puts bookstore['books']
      puts "storeName: #{bookstore['storeName']}, books: #{bookstore['books']}, cashBalance: #{bookstore['cashBalance']}, openingHours: #{bookstore['openingHours']}"
    end
  end

  private
  def self.load_data_as_json(file_path)
    raw_data = File.open(file_path)
    json = JSON.parse(raw_data.read)
    raw_data.close
    json
  end

  def self.parse_opening_hours_into_datetime opening_hours_in_str
    opening_hours_arr = opening_hours_in_str.split('/')
    opening_hours_arr.each do |opening_hour|
      puts opening_hour

      if opening_hour.include?(',')

      end

      if opening_hour.scan(/(?=-)/).count >= 2

      end
    end
  end
end
