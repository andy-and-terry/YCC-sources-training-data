def pascal(rows)
  Enumerator.new do |y|
    row = [1]
    rows.times do
      y << row
      row = [0, *row].zip([*row, 0]).map(&:sum)
    end
  end
end

tri = pascal(10).to_a
width = tri.last.join(' ').size
tri.each { |row| puts row.join(' ').center(width) }
puts "row sums are powers of two: #{tri.each_with_index.all? { |r, i| r.sum == 2**i }}"
