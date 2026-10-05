def gray(n)
  (0...(1 << n)).map { |i| i ^ (i >> 1) }
end

gray(3).each { |g| puts g.to_s(2).rjust(3, "0") }

def popcount(n) = n.to_s(2).count("1")

puts popcount(255)
puts 40 & -40
puts 5[0], 5[1], 5[2]
puts (1 << 10), (1024 >> 3), ~5
puts "0b1011".to_i(0), "0xff".hex, "777".oct
