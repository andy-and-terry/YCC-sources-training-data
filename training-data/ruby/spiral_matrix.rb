def spiral(matrix)
  m = matrix.map(&:dup)
  out = []
  until m.empty?
    out.concat(m.shift)
    m = m.transpose.reverse
  end
  out
end

grid = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
p spiral(grid)
p spiral([[1, 2, 3, 4], [5, 6, 7, 8]])
