def binary_gap(n: int) -> int:
    best, last = 0, None
    i = 0
    while n:
        if n & 1:
            if last is not None:
                best = max(best, i - last - 1)
            last = i
        n >>= 1
        i += 1
    return best


if __name__ == "__main__":
    for n in [9, 529, 20, 15, 1041]:
        print(n, bin(n), binary_gap(n))
