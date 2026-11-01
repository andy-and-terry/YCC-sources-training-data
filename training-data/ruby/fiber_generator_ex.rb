fib = Fiber.new do
  a, b = 0, 1
  loop do
    Fiber.yield a
    a, b = b, a + b
  end
end

puts 8.times.map { fib.resume }.inspect
