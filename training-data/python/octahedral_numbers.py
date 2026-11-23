# n(2n^2+1)/3
def term(n: int) -> int:
    return (n * (((2 * n) * n) + 1)) // 3


for n in range(1, 16):
    print(f"{n:2d} -> {term(n)}")
