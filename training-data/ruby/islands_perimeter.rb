def island_perimeter(grid)
  at = ->(r, c) { r.negative? || c.negative? ? 0 : grid.dig(r, c).to_i }
  grid.each_with_index.sum do |row, r|
    row.each_index.sum { |c| row[c] == 1 ? 4 - at[r - 1, c] - at[r + 1, c] - at[r, c - 1] - at[r, c + 1] : 0 }
  end
end

p island_perimeter([[0, 1, 0, 0], [1, 1, 1, 0], [0, 1, 0, 0], [1, 1, 0, 0]])
