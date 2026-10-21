# Stirling numbers of the second kind.
def stirling2(n, k)
  t = Array.new(n + 1) { Array.new(k + 1, 0) }
  t[0][0] = 1
  (1..n).each do |i|
    (1..[i, k].min).each { |j| t[i][j] = j * t[i - 1][j] + t[i - 1][j - 1] }
  end
  t[n][k]
end

puts stirling2(5, 2), stirling2(6, 3)
