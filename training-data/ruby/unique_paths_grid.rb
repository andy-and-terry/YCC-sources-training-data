def unique_paths(grid)
  dp = Array.new(grid[0].size, 0)
  dp[0] = grid[0][0].zero? ? 1 : 0
  grid.each do |row|
    row.each_with_index do |cell, c|
      dp[c] = cell == 1 ? 0 : dp[c] + (c.positive? ? dp[c - 1] : 0)
    end
  end
  dp.last
end

def binomial(n, k) = (1..k).reduce(1) { |acc, i| acc * (n - k + i) / i }

p unique_paths(Array.new(3) { Array.new(7, 0) })
p unique_paths([[0, 0, 0], [0, 1, 0], [0, 0, 0]])
puts "100x100 grid: #{binomial(198, 99)}"
