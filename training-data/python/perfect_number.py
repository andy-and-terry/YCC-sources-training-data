def divisor_sum(n):
    if n < 2:
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


def classify(n):
    s = divisor_sum(n)
    return "perfect" if s == n else "abundant" if s > n else "deficient"


if __name__ == "__main__":
    print([n for n in range(2, 10000) if divisor_sum(n) == n])
    for n in (12, 28, 35):
        print(n, classify(n))
