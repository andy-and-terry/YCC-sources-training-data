# Population count (number of set bits) for 0..15
puts (0..15).map { |n| n.to_s(2).count("1") }.join(" ")
