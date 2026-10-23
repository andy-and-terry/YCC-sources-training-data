def divisor_sum(n: int) -> int:
    return sum(d for d in range(1, n) if n % d == 0)


def is_abundant(n: int) -> bool:
    return divisor_sum(n) > n


if __name__ == "__main__":
    print([n for n in range(1, 60) if is_abundant(n)])
