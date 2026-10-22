def proper_divisor_sum(n: int) -> int:
    return sum(d for d in range(1, n) if n % d == 0)


def aliquot(start: int) -> list[int]:
    seq = [start]
    while seq[-1] != 0:
        seq.append(proper_divisor_sum(seq[-1]))
    return seq


if __name__ == "__main__":
    print(" ".join(map(str, aliquot(12))))
