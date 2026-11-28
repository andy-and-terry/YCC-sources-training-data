require 'set'

def jaccard(a, b)
  a, b = a.to_set, b.to_set
  union = a | b
  union.empty? ? 1.0 : (a & b).size.fdiv(union.size)
end

puts jaccard([1, 2, 3, 4], [3, 4, 5])
