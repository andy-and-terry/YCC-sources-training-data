require "set"

# Set algebra: union, intersection, difference, subset checks.
a = Set{1, 2, 3, 4}
b = Set{3, 4, 5}

p a | b
p a & b
p a - b
p a ^ b
puts (Set{3, 4}).subset_of?(a)
puts a.includes?(2)

seen = Set(Int32).new
dups = [1, 2, 2, 3, 3, 3].select { |n| !seen.add?(n) }
p dups
