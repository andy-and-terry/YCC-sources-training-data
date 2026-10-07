# Lazy iterators avoid building intermediate arrays.
evens = (1..).each.select(&.even?).map { |n| n * n }
p evens.first(5)

p (1..20).each.with_index.select { |n, i| i % 5 == 0 }.map(&.first).to_a

it = [1, 2, 3].each
puts it.next
puts it.next
puts it.next
puts it.next.is_a?(Iterator::Stop)

p [1, 2, 3].cycle.first(7)
p (1..3).each.zip(%w[a b c].each).to_a
