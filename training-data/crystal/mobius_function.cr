# Moebius function: 0 if n has a squared prime factor, else (-1)^k.
def mobius(n : Int32) : Int32
  result = 1
  p = 2
  while p * p <= n
    if n % p == 0
      n //= p
      return 0 if n % p == 0
      result = -result
    end
    p += 1
  end
  n > 1 ? -result : result
end

puts (1..30).map { |n| mobius(n) }.join(" ")
