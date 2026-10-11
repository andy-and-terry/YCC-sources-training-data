n = 1234
puts n.digits.inspect, n.digits.sum
puts n.to_s(2), n.to_s(16), "ff".hex, "0b101".to_i(0), "777".oct
puts n.bit_length, 255.bit_length
puts n[0], n[1], (n >> 2), (n << 2), (n & 0xff), (n | 1), (n ^ n)
puts ~5, -5.abs, 5.pred, 5.succ
puts 10.pow(20, 7), 2**64, (2**64).class
puts 17.gcd(5), 12.lcm(18), 12.gcdlcm(18).inspect
puts 10.fdiv(4), 10.divmod(3).inspect, -7.divmod(2).inspect, 7.remainder(-3)
puts Integer.sqrt(99), 3.14.floor, 3.99.to_i, 3.5.round, 2.5.round, 2.5.round(half: :even)
puts 1_000_000.to_s.reverse.scan(/\d{1,3}/).join(",").reverse
