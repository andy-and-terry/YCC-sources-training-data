def spiral_order(matrix : Array(Array(Int32))) : Array(Int32)
  result = [] of Int32
  return result if matrix.empty?

  top, bottom = 0, matrix.size - 1
  left, right = 0, matrix[0].size - 1

  while top <= bottom && left <= right
    (left..right).each { |c| result << matrix[top][c] }
    top += 1
    (top..bottom).each { |r| result << matrix[r][right] }
    right -= 1
    if top <= bottom
      right.downto(left) { |c| result << matrix[bottom][c] }
      bottom -= 1
    end
    if left <= right
      bottom.downto(top) { |r| result << matrix[r][left] }
      left += 1
    end
  end

  result
end

matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
puts spiral_order(matrix).inspect
