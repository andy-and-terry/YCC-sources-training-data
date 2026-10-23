def stern(count: int) -> list[int]:
    s = [0, 1]
    for i in range(2, count):
        s.append(s[i // 2] if i % 2 == 0 else s[i // 2] + s[i // 2 + 1])
    return s[:count]


if __name__ == "__main__":
    print(" ".join(map(str, stern(20))))
