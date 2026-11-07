def four_sum_count(a, b, c, d)
  sums = Hash(Int32, Int32).new(0)
  a.each { |x| b.each { |y| sums[x + y] += 1 } }
  count = 0
  c.each { |x| d.each { |y| count += sums[-(x + y)] } }
  count
end

puts four_sum_count([1, 2], [-2, -1], [-1, 2], [0, 2]) # 2
