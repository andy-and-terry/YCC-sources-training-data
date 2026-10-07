def flood_fill!(grid, r, c, color)
  target = grid[r][c]
  return 0 if target == color

  queue = [[r, c]]
  grid[r][c] = color
  filled = 1
  until queue.empty?
    y, x = queue.shift
    [[1, 0], [-1, 0], [0, 1], [0, -1]].each do |dy, dx|
      ny = y + dy
      nx = x + dx
      next unless ny.between?(0, grid.size - 1) && nx.between?(0, grid[ny].size - 1) && grid[ny][nx] == target

      grid[ny][nx] = color
      filled += 1
      queue << [ny, nx]
    end
  end
  filled
end

img = ['..####..', '.#....#.', '.#....#.', '..####..'].map(&:chars)
puts "filled #{flood_fill!(img, 1, 3, 'o')}"
img.each { |row| puts row.join }
