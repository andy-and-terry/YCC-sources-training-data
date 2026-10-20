q = Queue.new
producer = Thread.new { 5.times { |i| q << i * i }; q << :done }
results = []
consumer = Thread.new do
  while (v = q.pop) != :done
    results << v
  end
end
[producer, consumer].each(&:join)
puts results.inspect
m = Mutex.new
count = 0
10.times.map { Thread.new { 100.times { m.synchronize { count += 1 } } } }.each(&:join)
puts count
