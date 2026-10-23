def van_eck(count: int) -> list[int]:
    seq = [0]
    last_seen: dict[int, int] = {}
    for i in range(count - 1):
        cur = seq[i]
        nxt = i - last_seen[cur] if cur in last_seen else 0
        last_seen[cur] = i
        seq.append(nxt)
    return seq


if __name__ == "__main__":
    print(" ".join(map(str, van_eck(20))))
