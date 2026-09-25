def spiral(n)
  grid = Array.new(n) { Array.new(n, 0) }
  dirs = [[0, 1], [1, 0], [0, -1], [-1, 0]]
  r = c = d = 0
  (1..n * n).each do |k|
    grid[r][c] = k
    nr, nc = r + dirs[d][0], c + dirs[d][1]
    d = (d + 1) % 4 unless nr.between?(0, n - 1) && nc.between?(0, n - 1) && grid[nr][nc].zero?
    r += dirs[d][0]
    c += dirs[d][1]
  end
  grid
end

spiral(4).each { |row| puts row.map { |v| v.to_s.rjust(3) }.join }
