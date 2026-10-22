# Thue-Morse: t(n) is the parity of the number of 1 bits in n
print("".join(str(bin(n).count("1") % 2) for n in range(32)))
