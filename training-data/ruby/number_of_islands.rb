def count_islands(grid)
  rows = grid.size
  cols = grid[0].size
  visited = Array.new(rows) { Array.new(cols, false) }

  flood_fill = lambda do |r, c|
    return if r.negative? || r >= rows || c.negative? || c >= cols
    return if visited[r][c] || grid[r][c].zero?

    visited[r][c] = true
    flood_fill.call(r + 1, c)
    flood_fill.call(r - 1, c)
    flood_fill.call(r, c + 1)
    flood_fill.call(r, c - 1)
  end

  count = 0
  rows.times do |r|
    cols.times do |c|
      if grid[r][c] == 1 && !visited[r][c]
        count += 1
        flood_fill.call(r, c)
      end
    end
  end
  count
end

grid = [
  [1, 1, 0, 0],
  [1, 1, 0, 0],
  [0, 0, 1, 0],
  [0, 0, 0, 1]
]

puts count_islands(grid)
