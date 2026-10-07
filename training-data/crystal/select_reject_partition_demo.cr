nums = (1..12).to_a

evens, odds = nums.partition(&.even?)
puts evens.inspect
puts odds.inspect

puts nums.select { |n| n % 3 == 0 }.inspect
puts nums.reject { |n| n % 3 == 0 }.inspect
puts nums.group_by { |n| n % 4 }.inspect
puts nums.find { |n| n > 7 }.inspect
puts nums.index { |n| n > 100 }.inspect
puts nums.take_while { |n| n < 5 }.inspect
puts nums.skip_while { |n| n < 10 }.inspect
puts nums.min_by { |n| (n - 6).abs }
puts nums.count(&.odd?)
puts nums.any? { |n| n > 11 }
puts nums.all? { |n| n > 0 }
