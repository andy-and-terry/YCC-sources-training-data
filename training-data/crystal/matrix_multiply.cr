def matrix_multiply(a : Array(Array(Int32)), b : Array(Array(Int32))) : Array(Array(Int32))
  rows = a.size
  cols = b[0].size
  inner = b.size
  result = Array.new(rows) { Array.new(cols, 0) }
  rows.times do |i|
    cols.times do |j|
      inner.times do |k|
        result[i][j] += a[i][k] * b[k][j]
      end
    end
  end
  result
end

puts matrix_multiply([[1, 2], [3, 4]], [[5, 6], [7, 8]]).inspect
