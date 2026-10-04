require "set"

a = Set{1, 2, 3, 4}
b = Set{3, 4, 5, 6}

puts (a | b).to_a.sort.inspect
puts (a & b).to_a.sort.inspect
puts (a - b).to_a.sort.inspect
puts (a ^ b).to_a.sort.inspect

puts a.subset_of?(Set{1, 2, 3, 4, 5})
puts a.includes?(3)
puts a.add?(2).inspect
puts a.add?(9).inspect

unique = [3, 1, 3, 2, 1].to_set
puts unique.size
