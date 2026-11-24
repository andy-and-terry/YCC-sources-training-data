# Moser-de Bruijn sequence: sums of distinct powers of 4 (binary digits read in base 4).
def moser(n):
    return int(bin(n)[2:], 4)

print(*[moser(n) for n in range(12)])
