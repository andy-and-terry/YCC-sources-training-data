primes = (2..Float::INFINITY).lazy.select { |n| (2..Math.sqrt(n)).none? { |d| (n % d).zero? } }
p primes.first(8)
