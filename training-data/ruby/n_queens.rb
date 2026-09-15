def solve_n_queens(n)
  solutions = []
  columns = []

  place = lambda do |row|
    if row == n
      solutions << columns.dup
      return
    end

    n.times do |col|
      safe = columns.each_with_index.none? do |placed_col, placed_row|
        placed_col == col ||
          (placed_row - row).abs == (placed_col - col).abs
      end

      if safe
        columns << col
        place.call(row + 1)
        columns.pop
      end
    end
  end

  place.call(0)
  solutions
end

solutions = solve_n_queens(4)
puts solutions.length          # 2
puts solutions.first.inspect   # [1, 3, 0, 2]
