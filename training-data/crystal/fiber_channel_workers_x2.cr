ch = Channel(Int32).new
3.times { |i| spawn { ch.send(i * i) } }
puts 3.times.sum { ch.receive }
