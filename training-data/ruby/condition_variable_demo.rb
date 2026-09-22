mutex = Mutex.new
resource = ConditionVariable.new
queue = []

producer = Thread.new do
  3.times do |i|
    mutex.synchronize do
      queue << i
      puts "produced #{i}"
      resource.signal
    end
    sleep 0.01
  end
end

consumer = Thread.new do
  3.times do
    mutex.synchronize do
      resource.wait(mutex) while queue.empty?
      value = queue.shift
      puts "consumed #{value}"
    end
  end
end

producer.join
consumer.join
