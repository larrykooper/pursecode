class Order < ApplicationRecord

  def self.parse_input(input)
    lines = input.split("\n")
    order_exp = /Order Number: (.*)/
    if lines[0] =~ order_exp
      puts "order matches"
      puts "number is #{$1}"
    else
      puts "order no match"
    end
    date_exp = /Estimated delivery by (.*)/
    if lines[1] =~ date_exp
      puts "date matches"
      puts "date is #{$1}"
    else
      puts "date no match"
    end
  end


end
