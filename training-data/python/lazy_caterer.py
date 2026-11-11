# Lazy caterer sequence: max pieces from n cuts
def term(n: int) -> int:
    return ((n * (n + 1))//2) + 1


print(*(term(n) for n in range(10)))
