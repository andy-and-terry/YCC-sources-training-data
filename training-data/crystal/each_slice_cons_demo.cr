numbers = (1..10).to_a

numbers.each_slice(3) do |slice|
  puts "slice: #{slice}"
end

numbers.each_cons(4).first(2).each do |window|
  puts "window: #{window}"
end

moving_avg = numbers.each_cons(3).map { |w| w.sum / 3.0 }.to_a
puts moving_avg

evens, odds = numbers.partition(&.even?)
puts evens, odds

puts numbers.zip(numbers.rotate).first(3)
puts numbers.group_by { |n| n % 3 }
