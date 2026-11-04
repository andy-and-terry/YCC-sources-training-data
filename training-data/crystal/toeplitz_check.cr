def toeplitz?(m : Array(Array(Int32))) : Bool
  m.each_cons(2).all? { |(prev, cur)| cur[1..] == prev[0, cur.size - 1] }
end

puts toeplitz?([[1, 2, 3], [4, 1, 2], [5, 4, 1]])
puts toeplitz?([[1, 2], [2, 2]])
