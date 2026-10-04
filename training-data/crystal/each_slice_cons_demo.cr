numbers = (1..10).to_a

numbers.each_slice(3) { |slice| puts slice.inspect }

puts "--- windows ---"
numbers.each_cons(4) { |window| puts "#{window.inspect} sum=#{window.sum}" }

pairs = numbers.each_cons(2).map { |(a, b)| b - a }.to_a
puts pairs.inspect

puts numbers.in_groups_of(4, 0).inspect
