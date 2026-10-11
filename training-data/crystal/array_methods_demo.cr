a = [3, 1, 4, 1, 5, 9, 2, 6]

puts a.rotate(2).inspect
puts [[1, 2], [3, [4]]].flatten.inspect
puts [1, nil, 2, nil].compact.inspect
puts a.uniq.sort.reverse.inspect
puts [1, 2, 3].zip(["a", "b", "c"]).inspect
puts [1, 2].product([3, 4]).inspect
puts a.each_slice(3).to_a.inspect
puts a.minmax.inspect
puts a.index(5).inspect
puts a.values_at(0, 2, -1).inspect
puts a.sample.class
puts (a - [1, 9]).inspect
puts (a & [1, 2, 7]).inspect
puts a.first(3).inspect + a.last(2).inspect
puts a.take_while { |x| x < 5 }.inspect
