require "set"

a = Set{1, 2, 3, 4, 5}
b = Set{4, 5, 6, 7}

puts (a | b).to_a.sort.inspect
puts (a & b).to_a.sort.inspect
puts (a - b).to_a.sort.inspect
puts (a ^ b).to_a.sort.inspect
puts a.subset_of?(Set{1, 2, 3, 4, 5, 6})
puts a.superset_of?(Set{1, 2})
puts a.disjoint?(Set{9, 10})

a << 10
puts a.includes?(10)
a.delete(1)
puts a.size
