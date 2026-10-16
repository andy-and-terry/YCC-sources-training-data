prices = {"apple": 3, "pear": 5, "plum": 3, "fig": 8}

inverted = {}
for k, v in prices.items():
    inverted.setdefault(v, []).append(k)
print(inverted)

expensive = {k: v for k, v in prices.items() if v > 4}
print(expensive)

lengths = {word: len(word) for word in prices}
print(lengths)

swapped = {v: k for k, v in {"a": 1, "b": 2}.items()}
print(swapped)

squares = {n: n * n for n in range(1, 6) if n % 2}
print(squares)
