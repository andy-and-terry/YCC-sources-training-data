# Evil numbers have an even number of 1 bits in binary.
print(*[n for n in range(21) if bin(n).count("1") % 2 == 0])
