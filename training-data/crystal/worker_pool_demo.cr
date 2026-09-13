jobs = Channel(Int32).new
results = Channel(Int32).new

3.times do |worker_id|
  spawn do
    loop do
      job = jobs.receive?
      break if job.nil?
      results.send(job * job)
    end
  end
end

spawn do
  (1..6).each { |n| jobs.send(n) }
  jobs.close
end

total = 0
6.times { total += results.receive }
puts total
