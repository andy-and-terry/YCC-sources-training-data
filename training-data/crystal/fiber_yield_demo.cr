done = Channel(Nil).new

spawn do
  3.times do |i|
    puts "A#{i}"
    Fiber.yield
  end
  done.send(nil)
end

spawn do
  3.times do |i|
    puts "B#{i}"
    Fiber.yield
  end
  done.send(nil)
end

2.times { done.receive }
puts "both fibers finished"
