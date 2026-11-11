# Population count (number of set bits) for 0..15
def bits(n: int) -> int:
    return bin(n).count("1")


print(*(bits(n) for n in range(16)))
