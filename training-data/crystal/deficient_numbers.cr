# Deficient numbers below 100; expect 76.
def proper_sum(n : Int32) : Int32
  (1...n).select {  |d| n % d == 0 }.sum
end

puts (1...100).count { |n| proper_sum(n) < n }
