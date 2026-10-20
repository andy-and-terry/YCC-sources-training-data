# Lazy enumerators process infinite sequences on demand.
primes = (2..Float::INFINITY).lazy.select { |n| (2..Integer.sqrt(n)).none? { |d| (n % d).zero? } }
puts primes.first(8).inspect
puts (1..Float::INFINITY).lazy.map { |n| n * n }.reject(&:even?).first(4).inspect

fib = Enumerator.new do |y|
  a, b = 0, 1
  loop { y << a; a, b = b, a + b }
end
puts fib.take(10).inspect
