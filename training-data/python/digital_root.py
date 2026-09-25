def digital_root_loop(n):
    while n >= 10:
        n = sum(int(d) for d in str(n))
    return n


def digital_root(n):
    return 0 if n == 0 else 1 + (n - 1) % 9


if __name__ == "__main__":
    for n in (0, 16, 942, 132189, 493193):
        assert digital_root(n) == digital_root_loop(n)
        print(n, digital_root(n))
