def jaccard(a : Set(Int32), b : Set(Int32)) : Float64
  union = (a | b).size
  union.zero? ? 1.0 : (a & b).size / union
end

puts jaccard(Set{1, 2, 3, 4}, Set{3, 4, 5})
