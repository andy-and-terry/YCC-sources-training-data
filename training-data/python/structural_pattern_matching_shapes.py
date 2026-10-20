def describe(shape):
    match shape:
        case ("circle", r):
            return f"circle r={r}"
        case ("rect", w, h) if w == h:
            return f"square {w}"
        case ("rect", w, h):
            return f"rect {w}x{h}"
        case _:
            return "unknown"


if __name__ == "__main__":
    for s in [("circle", 2), ("rect", 3, 3), ("rect", 2, 5), ("tri",)]:
        print(describe(s))
