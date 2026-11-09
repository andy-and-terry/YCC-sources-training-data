require "prime"
p (1..Float::INFINITY).lazy.select(&:even?).map { |x| x * 3 }.first(4)
p Prime.lazy.select { |n| n % 4 == 1 }.first(5)
fib = Enumerator.new { |y| a, b = 0, 1; loop { y << a; a, b = b, a + b } }
p fib.take(10)
