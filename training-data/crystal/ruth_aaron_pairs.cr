# Sum of prime factors counted with multiplicity.
def sopfr(n : Int32) : Int32
  total = 0
  p = 2
  while p * p <= n
    while n % p == 0
      total += p
      n //= p
    end
    p += 1
  end
  total + (n > 1 ? n : 0)
end

puts (2...110).select { |n| sopfr(n) == sopfr(n + 1) }.join(" ")
