# Thue-Morse: t(n) is the parity of the number of 1 bits in n
println(join((count_ones(n) % 2 for n in 0:31)))
