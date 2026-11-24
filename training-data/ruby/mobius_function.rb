# Moebius function: 0 if n has a squared prime factor, else (-1)^k.
def mobius(n)
  result = 1
  p = 2
  while p * p <= n
    if (n % p).zero?
      n /= p
      return 0 if (n % p).zero?
      result = -result
    end
    p += 1
  end
  n > 1 ? -result : result
end

puts (1..30).map { |n| mobius(n) }.join(" ")
