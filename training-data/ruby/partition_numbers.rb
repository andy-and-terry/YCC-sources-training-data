# Integer partitions counted with a coin-style DP.
def partitions(n)
  ways = [1] + [0] * n
  (1..n).each do |part|
    (part..n).each { |t| ways[t] += ways[t - part] }
  end
  ways[n]
end

puts (0...10).map { |i| partitions(i) }.join(" ")
