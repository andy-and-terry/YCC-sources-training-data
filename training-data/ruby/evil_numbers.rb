# Evil numbers have an even number of 1 bits.
puts (0..20).select { |n| n.to_s(2).count("1").even? }.join(" ")
