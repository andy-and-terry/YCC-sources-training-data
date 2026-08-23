def second_largest(arr : Array(Int32)) : Int32?
  arr.uniq.sort.reverse[1]?
end

puts second_largest([5, 3, 8, 1, 9, 2])
