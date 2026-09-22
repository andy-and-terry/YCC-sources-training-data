require 'set'

a = Set.new([1, 2, 3, 4])
b = Set.new([3, 4, 5, 6])

puts (a & b).to_a.sort.inspect   # intersection
puts (a | b).to_a.sort.inspect   # union
puts (a - b).to_a.sort.inspect   # difference
puts a.subset?(Set.new([1, 2, 3, 4, 5]))
puts a.include?(3)

a << 10
puts a.to_a.sort.inspect

tags = Set.new
tags.add(:ruby)
tags.add(:ruby)  # duplicates are ignored
puts tags.size
