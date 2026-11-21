# Carmichael numbers: composite n where a**(n-1) = 1 (mod n) for all a coprime to n.
def prime?(n)
  n > 1 && (2..Integer.sqrt(n)).none? { |p| (n % p).zero? }
end

def carmichael?(n)
  return false if prime?(n)
  (2...n).all? { |a| a.gcd(n) != 1 || a.pow(n - 1, n) == 1 }
end

puts (3...3000).step(2).select { |n| carmichael?(n) }.join(" ")
