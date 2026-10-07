queue = Queue.new
results = Queue.new

workers = 3.times.map do |id|
  Thread.new do
    while (job = queue.pop) != :done
      results << [id, job, job * job]
    end
  end
end

10.times { |i| queue << i }
workers.size.times { queue << :done }
workers.each(&:join)

out = []
out << results.pop until results.empty?
puts out.map { |_, job, sq| [job, sq] }.sort.inspect
