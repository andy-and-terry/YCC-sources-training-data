def minimum_total(triangle)
  dp = triangle.last.dup
  (triangle.size - 2).downto(0) do |r|
    triangle[r].each_index { |i| dp[i] = triangle[r][i] + [dp[i], dp[i + 1]].min }
  end
  dp.first
end

puts minimum_total([[2], [3, 4], [6, 5, 7], [4, 1, 8, 3]]) # 11
