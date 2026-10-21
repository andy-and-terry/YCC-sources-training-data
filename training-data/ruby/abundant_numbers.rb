def divisor_sum(n)
  (1...n).select { |d| (n % d).zero? }.sum
end

puts (1...60).select { |n| divisor_sum(n) > n }.join(" ")
