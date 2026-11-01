ch = Channel(Int32).new
3.times do |i|
  spawn do
    ch.send(i * i)
  end
end
results = 3.times.map { ch.receive }.to_a.sort
puts results
