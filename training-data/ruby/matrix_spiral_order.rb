def spiral(matrix)
  result = []
  m = matrix.map(&:dup)
  until m.empty?
    result.concat(m.shift)
    m = m.transpose.reverse
  end
  result
end

grid = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]]
p spiral(grid)
p spiral([[1]])
p spiral([[1, 2], [3, 4]])
