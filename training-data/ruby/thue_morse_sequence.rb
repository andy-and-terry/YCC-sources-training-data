# Thue-Morse: t(n) is the parity of the number of 1 bits in n
puts (0...32).map { |n| n.to_s(2).count("1") % 2 }.join
