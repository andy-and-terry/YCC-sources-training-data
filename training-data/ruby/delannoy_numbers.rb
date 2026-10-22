def central_delannoy(count)
  grid = Array.new(count) { Array.new(count, 1) }
  (1...count).each do |m|
    (1...count).each do |n|
      grid[m][n] = grid[m - 1][n] + grid[m][n - 1] + grid[m - 1][n - 1]
    end
  end
  (0...count).map { |k| grid[k][k] }
end

puts central_delannoy(10).join(" ")
