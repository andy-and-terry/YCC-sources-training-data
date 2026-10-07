buffer = SizedQueue.new(2)

producer = Thread.new do
  5.times do |i|
    buffer.push(i)
    puts "produced #{i}"
  end
  buffer.push(nil)
end

consumer = Thread.new do
  consumed = []
  while (item = buffer.pop)
    consumed << item
  end
  consumed
end

producer.join
p consumer.value
