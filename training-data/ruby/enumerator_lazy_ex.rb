primes = (2..Float::INFINITY).lazy.select { |n| (2..Math.sqrt(n)).none? { |d| (n % d).zero? } }
p primes.first(8)
p (1..Float::INFINITY).lazy.map { |x| x * x }.reject(&:odd?).first(4)
