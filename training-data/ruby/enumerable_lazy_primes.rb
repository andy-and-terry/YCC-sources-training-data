require "prime"

first = (1..Float::INFINITY).lazy.select(&:even?).map { |n| n * n }.first(4)
p first
p Prime.lazy.select { |n| n % 10 == 3 }.first(5)
