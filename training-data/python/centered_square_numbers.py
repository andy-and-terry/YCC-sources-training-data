# Centered square numbers 2n(n+1)+1
def term(n: int) -> int:
    return ((2 * n) * (n + 1)) + 1


print(*(term(n) for n in range(10)))
