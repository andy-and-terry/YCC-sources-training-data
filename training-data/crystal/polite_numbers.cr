# Ways to write n as a sum of two or more consecutive positive integers.
def polite_ways(n : Int32) : Int32
  ways = 0
  k = 2
  while k * (k + 1) // 2 <= n
    ways += 1 if (n - k * (k - 1) // 2) % k == 0
    k += 1
  end
  ways
end

puts (1..16).map { |n| polite_ways(n) }.join(" ")
