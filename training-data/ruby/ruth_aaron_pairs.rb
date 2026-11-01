# Consecutive n, n+1 with equal sums of prime factors (with multiplicity).
def sopfr(n)
  total = 0
  p = 2
  while p * p <= n
    while (n % p).zero?
      total += p
      n /= p
    end
    p += 1
  end
  total + (n > 1 ? n : 0)
end

puts (2...110).select { |n| sopfr(n) == sopfr(n + 1) }.join(" ")
