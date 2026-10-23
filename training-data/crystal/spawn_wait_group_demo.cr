done = Channel(Int32).new
results = [] of Int32

3.times do |i|
  spawn do
    done.send((i + 1) * 10)
  end
end

3.times { results << done.receive }
puts results.sort.inspect
