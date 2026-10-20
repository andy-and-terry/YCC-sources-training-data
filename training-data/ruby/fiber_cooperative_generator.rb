f = Fiber.new do
  3.times { |i| Fiber.yield i }
  :finished
end
4.times { puts f.resume }
puts f.alive?

gen = Fiber.new do
  a, b = 0, 1
  loop { Fiber.yield a; a, b = b, a + b }
end
puts 8.times.map { gen.resume }.inspect
