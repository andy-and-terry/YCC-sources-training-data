# Fibbinary numbers: no two adjacent 1 bits.
puts (0...50).select { |n| (n & (n >> 1)) == 0 }.join(" ")
