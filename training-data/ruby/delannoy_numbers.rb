def central_delannoy(n)
  g = Array.new(n + 1) { Array.new(n + 1, 1) }
  (1..n).each do |i|
    (1..n).each { |j| g[i][j] = g[i - 1][j] + g[i][j - 1] + g[i - 1][j - 1] }
  end
  g[n][n]
end

puts (0..5).map { |n| central_delannoy(n) }.join(" ") # 1 3 13 63 321 1683
