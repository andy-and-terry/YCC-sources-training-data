a = [5, 3, 8, 1, 9, 2]
puts a.sort.inspect, a.sort { |x, y| y <=> x }.inspect
puts a.min, a.max, a.sum, a.minmax.inspect
puts a.take(2).inspect, a.drop(4).inspect
puts a.take_while { |x| x > 2 }.inspect, a.drop_while { |x| x > 2 }.inspect
puts a.partition(&:even?).inspect
puts a.each_slice(2).to_a.inspect
puts a.rotate(2).inspect, a.reverse.inspect
puts a.sample.class, a.shuffle(random: Random.new(1)).size
puts a.find_index(8), a.index { |x| x > 8 }
puts (a & [1, 2, 7]).inspect, (a | [100]).inspect, (a - [5, 3]).inspect
puts [[1, 2], [3]].flatten.inspect, [1, nil, 2, nil].compact.inspect
puts a.each_cons(2).map { |x, y| y - x }.inspect
