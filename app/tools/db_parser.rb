require 'json'
require 'date'

def load_data_as_json(file_path)
  bookstore_raw_data = File.open(file_path)
  json = JSON.parse(bookstore_raw_data.read)
  bookstore_raw_data.close
  json
end

def parse_opening_hours_into_datetime opening_hours_in_str
  opening_hours_arr = opening_hours_in_str.split('/')
  opening_hours_arr.each do |opening_hour|
    puts opening_hour

    if opening_hour.include?(',')

    end

    if opening_hour.scan(/(?=-)/).count >= 2

    end
  end
end

data = load_data_as_json('/Users/rongson/RailsProjects/book_storm_practice/data/book_store_data.json')

data.map do |bookstore|
  # puts bookstore['storeName']
  # puts bookstore['cashBalance']
  parse_opening_hours_into_datetime(bookstore['openingHours'])
  # puts bookstore['books']
  puts '-------------------'
end
