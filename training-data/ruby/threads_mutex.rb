mutex = Mutex.new
counter = 0

threads = 10.times.map do
  Thread.new do
    1000.times { mutex.synchronize { counter += 1 } }
  end
end
threads.each(&:join)

puts "Final count: #{counter}"
