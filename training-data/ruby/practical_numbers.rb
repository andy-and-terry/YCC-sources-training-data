# Practical numbers: every m in 1..n is a sum of distinct divisors of n.
def practical?(n)
  reach = 1 # bit i set <=> i is a subset sum
  (1..n).each { |d| reach |= reach << d if (n % d).zero? }
  mask = (1 << (n + 1)) - 1
  reach & mask == mask
end

puts (1..40).select { |n| practical?(n) }.join(" ")
