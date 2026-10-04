def pascal(n : Int32) : Array(Array(Int32))
  rows = [[1]]
  (n - 1).times do
    prev = rows.last
    rows << ([0] + prev).zip(prev + [0]).map { |a, b| a + b }
  end
  rows
end

pascal(6).each do |row|
  puts row.join(" ").center(20)
end
