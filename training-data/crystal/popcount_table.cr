# Population count (number of set bits) for 0..15
puts (0...16).map { |n| n.popcount }.join(" ")
