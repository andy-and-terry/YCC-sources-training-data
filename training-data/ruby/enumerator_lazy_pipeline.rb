primes = (2..).lazy.select { |n| (2..Math.sqrt(n)).none? { |d| (n % d).zero? } }
puts primes.first(8).inspect
puts (1..Float::INFINITY).lazy.map { |x| x * x }.reject(&:even?).take(4).to_a.inspect
e = Enumerator.new { |y| a, b = 0, 1; loop { y << a; a, b = b, a + b } }
puts e.take(10).inspect
