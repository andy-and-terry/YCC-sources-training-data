r = [1, 2, 3].tap { |a| puts "size #{a.size}" }.map { |x| x * 2 }.then { |a| a.sum }
puts r
puts 5.then { _1 + 1 }, [1, 2].map { _1 * 3 }.inspect
puts nil.to_a.inspect, nil.to_s.empty?, nil&.length.inspect, Integer("42", exception: false).inspect, Integer("x", exception: false).inspect
