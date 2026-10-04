# Thread pool fed from a Queue; results gathered through another Queue.
jobs = Queue.new
results = Queue.new

(1..10).each { |n| jobs << n }
4.times { jobs << :done }

workers = 4.times.map do
  Thread.new do
    while (job = jobs.pop) != :done
      results << [job, job * job]
    end
  end
end
workers.each(&:join)

out = []
out << results.pop until results.empty?
p out.sort.to_h

sized = SizedQueue.new(2)
producer = Thread.new { 5.times { |i| sized << i }; sized << nil }
consumed = []
while (item = sized.pop)
  consumed << item
end
producer.join
p consumed
