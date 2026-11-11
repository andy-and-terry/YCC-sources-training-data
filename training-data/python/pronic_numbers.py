# Pronic numbers n(n+1)
def term(n: int) -> int:
    return n * (n + 1)


print(*(term(n) for n in range(10)))
