# Fibbinary numbers: no two adjacent 1 bits in the binary representation.
def is_fibbinary(n):
    return n & (n >> 1) == 0

print(*[n for n in range(50) if is_fibbinary(n)])
