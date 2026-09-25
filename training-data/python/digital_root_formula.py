def digital_root(n: int) -> int:
    return 0 if n == 0 else 1 + (n - 1) % 9


def digital_root_iter(n: int) -> int:
    while n >= 10:
        n = sum(map(int, str(n)))
    return n


if __name__ == "__main__":
    for n in [0, 16, 942, 132189, 493193]:
        assert digital_root(n) == digital_root_iter(n)
        print(n, digital_root(n))
