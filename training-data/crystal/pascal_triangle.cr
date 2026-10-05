def pascal(rows : Int32) : Array(Array(Int64))
  triangle = [] of Array(Int64)
  rows.times do |i|
    row = Array(Int64).new(i + 1, 1_i64)
    (1...i).each do |j|
      row[j] = triangle[i - 1][j - 1] + triangle[i - 1][j]
    end
    triangle << row
  end
  triangle
end

pascal(6).each do |row|
  puts row.join(" ")
end
