def saddle_points(matrix)
  col_mins = matrix.transpose.map(&:min)
  matrix.each_with_index.flat_map do |row, r|
    row_max = row.max
    row.each_index.select { |c| row[c] == row_max && row[c] == col_mins[c] }.map { |c| [r, c] }
  end
end

p saddle_points([[9, 8, 7], [5, 3, 2], [6, 6, 7]])
