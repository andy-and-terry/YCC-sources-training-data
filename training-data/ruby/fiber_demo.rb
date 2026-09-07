fiber = Fiber.new do
  3.times do |i|
    Fiber.yield "step #{i}"
  end
  "done"
end

4.times do
  puts fiber.resume
end

counter = Fiber.new do
  total = 0
  loop do
    amount = Fiber.yield total
    total += amount
  end
end

counter.resume
puts counter.resume(5)
puts counter.resume(10)
puts counter.resume(2)
