def encode(text: str, rails: int) -> str:
    rows = [[] for _ in range(rails)]
    r, step = 0, 1
    for ch in text:
        rows[r].append(ch)
        if r == 0:
            step = 1
        elif r == rails - 1:
            step = -1
        r += step
    return "".join("".join(row) for row in rows)


if __name__ == "__main__":
    print(encode("WEAREDISCOVERED", 3))  # WECRERDSOEEAIVD
