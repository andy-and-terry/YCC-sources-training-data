def recaman(count: int) -> list[int]:
    seq = [0]
    seen = {0}
    for n in range(1, count):
        candidate = seq[-1] - n
        if candidate < 0 or candidate in seen:
            candidate = seq[-1] + n
        seq.append(candidate)
        seen.add(candidate)
    return seq


if __name__ == "__main__":
    print(" ".join(map(str, recaman(20))))
