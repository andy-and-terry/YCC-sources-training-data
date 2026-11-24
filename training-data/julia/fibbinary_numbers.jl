# Fibbinary numbers: no two adjacent 1 bits.
println(join(filter(n -> n & (n >> 1) == 0, 0:49), " "))
