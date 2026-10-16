require "bit_array"

flags = BitArray.new(10)
[1, 3, 4, 9].each { |i| flags[i] = true }

puts flags
puts flags.count(true)
puts flags[3]
flags.toggle(3)
puts flags[3]

sieve = BitArray.new(30, true)
sieve[0] = sieve[1] = false
(2..5).each do |i|
  next unless sieve[i]
  (i * i).step(to: 29, by: i) { |j| sieve[j] = false }
end
puts (0...30).select { |i| sieve[i] }.inspect
