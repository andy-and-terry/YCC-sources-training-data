3.times { |i| print i, ' ' }
puts

1.upto(5) { |i| print i, ' ' }
puts

5.downto(1) { |i| print i, ' ' }
puts

0.step(to: 20, by: 5) { |i| print i, ' ' }
puts

puts 4.times.map { |i| i * i }.to_a.inspect
