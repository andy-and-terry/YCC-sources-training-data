def four_sum_count(a, b, c, d)
  sums = Hash.new(0)
  a.product(b) { |x, y| sums[x + y] += 1 }
  c.product(d).sum { |x, y| sums[-(x + y)] }
end

puts four_sum_count([1, 2], [-2, -1], [-1, 2], [0, 2]) # 2
