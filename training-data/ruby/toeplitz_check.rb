def toeplitz?(m)
  m.each_cons(2).all? { |prev, cur| cur.drop(1) == prev.take(cur.size - 1) }
end

p toeplitz?([[1, 2, 3], [4, 1, 2], [5, 4, 1]])
p toeplitz?([[1, 2], [2, 2]])
