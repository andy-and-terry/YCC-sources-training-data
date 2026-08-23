def factorial(n : Int32) : Int64
  n <= 1 ? 1_i64 : n * factorial(n - 1)
end

(0..10).each { |i| puts factorial(i) }
