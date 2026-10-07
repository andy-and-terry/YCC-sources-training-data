from collections import Counter


def histogram(values, width=40):
    counts = Counter(values)
    peak = max(counts.values())
    lines = []
    for key in sorted(counts):
        bar = "#" * max(1, round(counts[key] / peak * width))
        lines.append(f"{key!s:>6} | {bar} {counts[key]}")
    return "\n".join(lines)


if __name__ == "__main__":
    print(histogram("the rain in spain falls mainly on the plain".replace(" ", "")))
