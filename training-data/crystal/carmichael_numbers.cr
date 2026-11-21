# Carmichael numbers: composite n where a**(n-1) = 1 (mod n) for all a coprime to n.
def pow_mod(b : Int64, e : Int64, m : Int64) : Int64
  r = 1_i64
  b %= m
  while e > 0
    r = r * b % m if e.odd?
    b = b * b % m
    e >>= 1
  end
  r
end

def prime?(n : Int64) : Bool
  return false if n < 2
  p = 2_i64
  while p * p <= n
    return false if n % p == 0
    p += 1
  end
  true
end

def carmichael?(n : Int64) : Bool
  return false if prime?(n)
  (2_i64...n).all? { |a| a.gcd(n) != 1 || pow_mod(a, n - 1, n) == 1 }
end

puts (3_i64...3000_i64).step(2).select { |n| carmichael?(n) }.join(" ")
