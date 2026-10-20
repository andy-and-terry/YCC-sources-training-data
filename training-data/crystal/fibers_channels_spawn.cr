ch = Channel(Int32).new
results = Channel(Int32).new

3.times do |i|
  spawn do
    sum = 0
    10.times { |j| sum += (i + 1) * j }
    results.send(sum)
  end
end
puts (0...3).map { results.receive }.sort.inspect

spawn do
  5.times { |i| ch.send(i * i) }
  ch.close
end
total = 0
while v = ch.receive?
  total += v
end
puts total

done = Channel(Nil).new
spawn { sleep 0.01.seconds; done.send(nil) }
select
when done.receive
  puts "done"
when timeout(1.second)
  puts "timeout"
end

mutex = Mutex.new
count = 0
wg = Channel(Nil).new
4.times { spawn { 100.times { mutex.synchronize { count += 1 } }; wg.send(nil) } }
4.times { wg.receive }
puts count
