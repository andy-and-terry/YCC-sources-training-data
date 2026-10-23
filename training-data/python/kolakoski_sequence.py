def kolakoski(count: int) -> list[int]:
    seq = [1, 2, 2]
    i = 2
    while len(seq) < count:
        value = 1 if seq[-1] == 2 else 2
        seq.extend([value] * seq[i])
        i += 1
    return seq[:count]


if __name__ == "__main__":
    print(" ".join(map(str, kolakoski(20))))
