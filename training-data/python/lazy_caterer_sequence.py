# n(n+1)/2+1
def term(n: int) -> int:
    return ((n * (n + 1)) // 2) + 1


for n in range(1, 16):
    print(f"{n:2d} -> {term(n)}")
