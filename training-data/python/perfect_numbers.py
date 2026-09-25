def aliquot_sum(n: int) -> int:
    if n == 1:
        return 0
    total = 1
    i = 2
    while i * i <= n:
        if n % i == 0:
            total += i
            if i != n // i:
                total += n // i
        i += 1
    return total


def classify(n: int) -> str:
    s = aliquot_sum(n)
    return "perfect" if s == n else "abundant" if s > n else "deficient"


if __name__ == "__main__":
    for n in [6, 12, 28, 13]:
        print(n, classify(n))
