def kolakoski(count: int) -> list[int]:
    seq = [1, 2, 2]
    i = 2
    while len(seq) < count:
        seq.extend([3 - seq[-1]] * seq[i])
        i += 1
    return seq[:count]


if __name__ == "__main__":
    print(" ".join(map(str, kolakoski(20))))
