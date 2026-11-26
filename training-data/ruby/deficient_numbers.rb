# Deficient numbers below 100; expect 76.
def proper_sum(n)
  (1...n).select { |d| (n % d).zero? }.sum
end

puts (1...100).count { |n| proper_sum(n) < n }
