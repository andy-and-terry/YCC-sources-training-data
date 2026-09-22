def n_queens(n)
  solutions = []
  columns = []

  place = lambda do |row|
    if row == n
      solutions << columns.dup
      return
    end

    (0...n).each do |col|
      next unless safe?(columns, row, col)

      columns << col
      place.call(row + 1)
      columns.pop
    end
  end

  place.call(0)
  solutions
end

def safe?(columns, row, col)
  columns.each_with_index.all? do |placed_col, placed_row|
    placed_col != col && (placed_col - col).abs != (placed_row - row).abs
  end
end

solutions = n_queens(4)
puts solutions.length
puts solutions.first.inspect
