# n(n+1)(2n+1)/6
def term(n: int) -> int:
    return ((n * (n + 1)) * ((2 * n) + 1)) // 6


for n in range(1, 16):
    print(f"{n:2d} -> {term(n)}")
