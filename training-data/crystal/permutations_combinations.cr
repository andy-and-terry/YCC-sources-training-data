# Built-in combinatorics on arrays.
items = [1, 2, 3]

p items.permutations
p items.combinations(2)
p items.each_permutation.to_a.size
p items.each_combination(2).to_a
p items.product(%w[a b])
p items.reverse_each.to_a
p items.rotate
p items.sample.class
