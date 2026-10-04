require "set"

a = Set{1, 2, 3, 4}
b = Set{3, 4, 5}

puts "union: #{(a | b).to_a.sort}"
puts "intersection: #{(a & b).to_a.sort}"
puts "difference: #{(a - b).to_a.sort}"
puts "symmetric: #{(a ^ b).to_a.sort}"
puts "subset? #{Set{3, 4}.subset_of?(a)}"
puts "disjoint? #{Set{9}.intersects?(a)}"

seen = Set(String).new
%w[x y x z y].each { |w| puts "dup #{w}" unless seen.add?(w) }
