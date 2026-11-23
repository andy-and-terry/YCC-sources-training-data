# n^2(n+1)/2
def term(n: int) -> int:
    return ((n * n) * (n + 1)) // 2


for n in range(1, 16):
    print(f"{n:2d} -> {term(n)}")
