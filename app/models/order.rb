require "Date"

class Order < ApplicationRecord

  def self.parse_input(input)
    lines = input.split("\n")
    order_exp = /Order Number: (.*)/
    order_number_exp = /\d{3}-\d{7}-\d{7}$/
    if lines[0] =~ order_exp
      order_number = $1.strip
      puts "order matches"
      puts "number is #{order_number}"
    else
      puts "order no match"
      return { result: false }
    end
    if order_number =~ order_number_exp
      puts "order number matches"
    else
      puts "order number is bad"
    end
    date_exp = /Estimated delivery by (.*)/
    if lines[1] =~ date_exp
      date_string = $1
      puts "date_string matches"
      puts "date_string is #{date_string}"
    else
      puts "date_string no match"
      return { result: false }
    end
    dates = date_string.split("-")
    start_date = dates[0]
    end_date = dates[1]
    puts "start_date: #{start_date}"
    puts "end_date: #{end_date}"
    # I planned to use the Ruby DateTime class to parse the date strings
    {result: true, order_number: order_number, delivery_date: date_string }
  end


end
