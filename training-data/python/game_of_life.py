from collections import Counter


def step(live):
    counts = Counter(
        (x + dx, y + dy) for x, y in live for dx in (-1, 0, 1) for dy in (-1, 0, 1) if dx or dy
    )
    return {c for c, n in counts.items() if n == 3 or (n == 2 and c in live)}


def show(live, w, h):
    return "\n".join("".join("#" if (x, y) in live else "." for x in range(w)) for y in range(h))


if __name__ == "__main__":
    glider = {(1, 0), (2, 1), (0, 2), (1, 2), (2, 2)}
    for gen in range(4):
        print(f"gen {gen}\n{show(glider, 6, 6)}\n")
        glider = step(glider)
