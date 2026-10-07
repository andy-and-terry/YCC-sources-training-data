def rotate_90(matrix : Array(Array(Int32))) : Array(Array(Int32))
  n = matrix.size
  result = Array.new(n) { Array.new(n, 0) }
  (0...n).each do |r|
    (0...n).each do |c|
      result[c][n - 1 - r] = matrix[r][c]
    end
  end
  result
end

matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
rotated = rotate_90(matrix)
rotated.each { |row| puts row.inspect }
