# Iterators are lazy; nothing runs until consumed.
evens = (1..Int32::MAX).each.select(&.even?).map { |x| x * x }
puts evens.first(5)

it = [1, 2, 3].each
puts it.next
puts it.next
puts it.next
puts it.next.is_a?(Iterator::Stop)

puts (1..3).cycle.first(7)
puts [1, 2, 3].each_with_index.map { |x, i| x * i }.to_a
puts (1..20).each.skip(5).take_while { |x| x < 10 }.to_a
