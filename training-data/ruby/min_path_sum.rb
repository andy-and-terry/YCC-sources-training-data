def min_path_sum(grid)
  rows = grid.size
  cols = grid[0].size
  dp = Array.new(rows) { Array.new(cols) }
  rows.times do |r|
    cols.times do |c|
      prev = [r.positive? ? dp[r - 1][c] : nil, c.positive? ? dp[r][c - 1] : nil].compact.min || 0
      dp[r][c] = grid[r][c] + prev
    end
  end
  path = [[rows - 1, cols - 1]]
  r, c = path.first
  until r.zero? && c.zero?
    if r.zero? || (c.positive? && dp[r][c - 1] < dp[r - 1][c])
      c -= 1
    else
      r -= 1
    end
    path.unshift([r, c])
  end
  [dp[-1][-1], path]
end

cost, path = min_path_sum([[1, 3, 1], [1, 5, 1], [4, 2, 1]])
puts "cost #{cost} path #{path.inspect}"
