require "set"

a = Set{1, 2, 3, 4, 5}
b = Set{4, 5, 6, 7}

puts "union: #{(a | b).to_a.sort}"
puts "intersection: #{(a & b).to_a.sort}"
puts "difference: #{(a - b).to_a.sort}"
puts "symmetric: #{(a ^ b).to_a.sort}"
puts "subset? #{Set{1, 2}.subset_of?(a)}"
puts "disjoint? #{a.intersects?(Set{9, 10})}"

seen = Set(String).new
%w(a b a c b).each do |item|
  puts "duplicate: #{item}" unless seen.add?(item)
end
