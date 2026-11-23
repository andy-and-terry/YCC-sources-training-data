# 3n(n-1)+1
def term(n: int) -> int:
    return ((3 * n) * (n - 1)) + 1


for n in range(1, 16):
    print(f"{n:2d} -> {term(n)}")
