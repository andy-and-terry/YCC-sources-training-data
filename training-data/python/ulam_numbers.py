def ulam(count: int) -> list[int]:
    seq = [1, 2]
    n = 2
    while len(seq) < count:
        n += 1
        ways = sum(1 for a in seq if a < n - a and (n - a) in seq)
        if ways == 1:
            seq.append(n)
    return seq


if __name__ == "__main__":
    print(" ".join(map(str, ulam(15))))
