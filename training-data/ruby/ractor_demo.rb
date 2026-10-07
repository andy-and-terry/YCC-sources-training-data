# Ractor gives true parallel execution (no shared mutable state) by
# passing messages between isolated actors instead of using threads
# and locks.

producer = Ractor.new do
  5.times { |i| Ractor.yield(i * i) }
  :done
end

squares = []
loop do
  value = producer.take
  break if value == :done
  squares << value
end
puts squares.inspect

doubler = Ractor.new do
  loop do
    n = Ractor.receive
    Ractor.yield(n * 2)
  end
end

[1, 2, 3].each do |n|
  doubler.send(n)
  puts doubler.take
end
