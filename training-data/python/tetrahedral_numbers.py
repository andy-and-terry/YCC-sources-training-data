# Tetrahedral numbers n(n+1)(n+2)/6
def term(n: int) -> int:
    return ((n * (n + 1)) * (n + 2))//6


print(*(term(n) for n in range(10)))
