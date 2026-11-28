def jaccard(a, b):
    a, b = set(a), set(b)
    return len(a & b) / len(a | b) if a | b else 1.0

print(jaccard([1, 2, 3, 4], [3, 4, 5]))
print(jaccard("night", "nacht"))
