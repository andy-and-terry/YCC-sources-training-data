nested = [[1, 2], [3, [4, 5]], [6]]
puts nested.flatten.inspect

maybe = [1, nil, 3, nil, 5]
puts maybe.compact.inspect

puts [1, 2, 3].flat_map { |x| [x, x * 10] }.inspect
puts %w[a-b c-d].flat_map(&.split('-')).inspect
