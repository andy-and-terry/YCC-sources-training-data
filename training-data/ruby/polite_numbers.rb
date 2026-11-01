# Ways to write n as a sum of two or more consecutive positive integers.
def polite_ways(n)
  (2..n).take_while { |k| k * (k + 1) / 2 <= n }
        .count { |k| ((n - k * (k - 1) / 2) % k).zero? }
end

puts (1..16).map { |n| polite_ways(n) }.join(" ")
