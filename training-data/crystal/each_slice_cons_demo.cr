data = (1..10).to_a

data.each_slice(3) { |chunk| puts chunk.inspect }

moving_sums = data.each_cons(3).map(&.sum).to_a
puts moving_sums.inspect

puts data.each_with_object([] of Int32) { |n, acc| acc << n * n if n.even? }.inspect
puts data.zip(data.rotate).first(3).inspect
puts data.in_groups_of(4, 0).inspect
puts data.reduce { |acc, n| acc * n }
puts data.sum { |n| n * 0.5 }
