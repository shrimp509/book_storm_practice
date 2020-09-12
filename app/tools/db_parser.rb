require 'json'
require 'date'

class DbParser

  def self.clear_all_data
    [Book, Bookstore, User, BooksInBookstore, PurchaseHistory, OpeningHour].map(&:delete_all)
  end

  def self.pour_book_stores_data book_store_data_file_path
    load_data_as_json(book_store_data_file_path).map do |bookstore|
      # puts "storeName: #{bookstore['storeName']}, books: #{bookstore['books']}, cashBalance: #{bookstore['cashBalance']}, openingHours: #{bookstore['openingHours']}"

      store = Bookstore.create(name: bookstore['storeName'], cash_balance: bookstore['cashBalance'])
      books_in_store = bookstore['books'].map do |book_hash|
        book = Book.create(name: book_hash['bookName'])
        [BooksInBookstore.create(bookstore_id: store.id, book_id: book.id, price: book_hash['price'])]
      end
      # opening_hours = parse_opening_hours_into_datetime(bookstore[:openingHours])
      # opening_hours.map { |opening_hour| opening_hour }
      # OpeningHour.create()
    end
  end

  def self.pour_users_data user_data_file_path
    load_data_as_json(user_data_file_path).map do |user|
      # puts "id: #{user[:id]}, name: #{user[:name]}, cashBalance: #{user['cashBalance']}, purchaseHistory: #{user['purchaseHistory']}"
      #
      # user = User.create(id: user[:id], name: user[:name], cash_balance: user[:cashBalance])
      # book = Book.create()
      # PurchaseHistory.create()

      # user[:purchaseHistory].map do |purchase_history|
      #   [PurchaseHistory.create()]
      # end
    end
  end

  private
  def self.load_data_as_json(file_path)
    raw_data = File.open(file_path)
    json = JSON.parse(raw_data.read)
    raw_data.close
    json
  end

  # Mon, Fri 2:30 pm - 8 pm / Tues 11 am - 2 pm / Wed 1:15 pm - 3:15 am / Thurs 10 am - 3:15 am / Sat 5 am - 11:30 am / Sun 10:45 am - 5 pm
  # Mon, Wed 11:45 am - 4:45 pm / Tues 7:45 am - 2 am / Thurs 5:45 pm - 12 am / Fri, Sun 6 am - 9 pm / Sat 10:15 am - 9 pm
  # Mon 11:45 am - 4:45 pm / Tues 7:45 am - 2 pm / Thurs 5:45 pm - 12 am / Wed, Fri, Sun 7 am - 9 pm / Sat 10:15 am - 9 pm
  # Mon 1:45 pm - 3 pm / Tues 8:45 am - 2:15 am / Wed 6:45 am - 10:45 am / Thurs, Sat 5:45 am - 11:15 am / Fri 3:45 pm - 2:30 am / Sun 5 pm - 3:45 am
  # Mon 5 pm - 10:30 pm / Tues, Sat 5 pm - 6:45 pm / Wed - Thurs 3:15 pm - 3:45 am / Fri 9:15 am - 10:45 am / Sun 10:45 am - 3:45 pm
  # Mon - Wed 11 am - 9 pm / Thurs 6 am - 9 pm / Fri 7 pm - 7 am / Sat 2:45 pm - 1:30 am / Sun 7 am - 4:15 pm
  # Mon 6 am - 8:30 pm / Tues - Wed 6:45 am - 3 pm / Thurs 6:15 am - 8:30 am / Fri 4 pm - 10:15 pm / Sat 1:30 pm - 11:45 pm / Sun 6:30 am - 8:15 am
  # Mon 4:30 pm - 11:15 pm / Tues, Sat 3:30 pm - 5 pm / Wed 5:15 am - 9:30 pm / Thurs 1 pm - 2:15 pm / Fri 6:45 am - 7:45 am / Sun 8:30 am - 2 am
  # Mon 10:30 am - 3:15 pm / Tues - Wed 7:15 am - 12:30 am / Thurs 6:45 am - 12 am / Fri 5 am - 11:30 pm / Sat - Sun 5:30 am - 9:45 am
  # Mon 5 pm - 2 am / Tues - Wed 9:30 am - 8 pm / Thurs 8:15 am - 11 pm / Fri 5 pm - 10:15 pm / Sat 5:30 am - 5 pm / Sun 11:45 am - 6 pm
  def self.parse_opening_hours_into_datetime opening_hours_in_str
    opening_hours_in_str.split('/').each do |opening_hour|
      if opening_hour.include?(',')
        
      elsif opening_hour.scan(/(?=-)/).count >= 2

      end
    end
  end

  def self.num_from(day)
    case day
    when "Mon"
      return 1
    when "Tues"
      return 2
    when "Wed"
      return 3
    when "Thurs"
      return 4
    when "Fri"
      return 5
    when "Sat"
      return 6
    when "Sun"
      return 7
    end
  end
end
